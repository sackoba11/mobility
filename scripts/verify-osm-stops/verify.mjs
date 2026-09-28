// Compare les arrêts de bus OSM (Overpass, gratuit sans clé) au catalogue
// Firestore `stops` : répond "nos arrêts correspondent-ils à la map ?"
// et liste les arrêts OSM absents du catalogue (candidats à ajouter).
//
// Requiert GOOGLE_APPLICATION_CREDENTIALS (lecture Firestore, même sans
// --apply). Seul --apply ÉCRIT (ajout des manquants).
//
// Usage :
//   npm install   (dans scripts/verify-osm-stops)
//   node verify.mjs [--bbox minLng,minLat,maxLng,maxLat] [--cell 0.1]
//                   [--apply]
//   Défaut : Abidjan (-4.35,5.20,-3.75,5.70), cellules 0.1°.
import { writeFile } from 'node:fs/promises';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

const APPLY = process.argv.includes('--apply');
const [minLng, minLat, maxLng, maxLat] =
  (arg('--bbox', '-4.35,5.20,-3.75,5.70')).split(',').map(Number);
const CELL = parseFloat(arg('--cell', '0.1'));
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function overpassCell(south, west, north, east) {
  const q = `[out:json][timeout:60];(` +
    `node["highway"="bus_stop"](${south},${west},${north},${east});` +
    `node["public_transport"="platform"](${south},${west},${north},${east});` +
    `node["amenity"="bus_station"](${south},${west},${north},${east});` +
    `);out 500;`;
  const res = await fetch('https://overpass-api.de/api/interpreter', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ data: q }),
    signal: AbortSignal.timeout(70000),
  });
  if (!res.ok) throw new Error(`Overpass ${res.status}`);
  const body = await res.json();
  return Array.isArray(body.elements) ? body.elements : [];
}

const seen = new Map();
let cells = 0, failed = 0;
for (let lat = minLat; lat < maxLat; lat += CELL) {
  for (let lng = minLng; lng < maxLng; lng += CELL) {
    const south = lat.toFixed(4), west = lng.toFixed(4);
    const north = Math.min(lat + CELL, maxLat).toFixed(4);
    const east = Math.min(lng + CELL, maxLng).toFixed(4);
    try {
      const elements = await overpassCell(south, west, north, east);
      for (const e of elements) {
        if (typeof e.lat !== 'number' || typeof e.lon !== 'number') continue;
        seen.set(`node/${e.id}`, {
          osmId: `node/${e.id}`,
          name: e.tags?.name ?? '',
          lat: e.lat,
          lng: e.lon,
        });
      }
      cells++;
      process.stdout.write(`\rCellules: ${cells} (${seen.size} arrêts OSM)`);
    } catch (e) {
      failed++;
      console.log(`\n! cellule ${south},${west} ignorée (${e.message})`);
    }
    await sleep(1200); // fair-use Overpass
  }
}
console.log(`\n${seen.size} arrêts OSM uniques (${failed} cellules en échec)`);

// Catalogue Firestore.
let catalog = new Map();
if (APPLY || true) {
  const admin = (await import('firebase-admin')).default;
  admin.initializeApp({
    credential: admin.credential.applicationDefault(),
    projectId: 'mobilityplus-74105',
  });
  const snap = await admin.firestore().collection('stops').get();
  snap.forEach((d) => {
    const data = d.data();
    if (data.osmId) catalog.set(data.osmId, { docId: d.id, ...data });
  });
}
console.log(`${catalog.size} docs dans stops`);

const matched = [], missing = [], orphan = [];
for (const [osmId, stop] of seen) {
  if (catalog.has(osmId)) matched.push({ ...stop, docId: catalog.get(osmId).docId });
  else missing.push(stop);
}
for (const [osmId, doc] of catalog) {
  if (!seen.has(osmId) && typeof doc.lat === 'number' && typeof doc.lng === 'number'
      && doc.lng >= minLng && doc.lng <= maxLng && doc.lat >= minLat && doc.lat <= maxLat) {
    orphan.push({ osmId, name: doc.name, docId: doc.docId });
  }
}

console.log(`\n== Correspondances : ${matched.length} (dans les deux)`);
console.log(`== Absents du catalogue : ${missing.length} (candidats OSM)`);
for (const m of missing.slice(0, 50)) {
  console.log(`   + ${m.osmId} "${m.name || '(sans nom)'}" ${m.lat},${m.lng}`);
}
if (missing.length > 50) console.log(`   ... et ${missing.length - 50} autres (voir rapport JSON)`);
console.log(`== Dans le catalogue mais plus sur OSM : ${orphan.length}`);

await writeFile(
  new URL('./rapport-osm.json', import.meta.url),
  JSON.stringify({ matched: matched.length, missing, orphan }, null, 1),
);
console.log('Rapport complet : scripts/verify-osm-stops/rapport-osm.json');

if (APPLY && missing.length > 0) {
  const admin = (await import('firebase-admin')).default;
  const db = admin.firestore();
  let batch = db.batch(), n = 0, added = 0;
  for (const m of missing) {
    const ref = db.collection('stops').doc(m.osmId.replace('/', '_'));
    batch.set(ref, {
      osmId: m.osmId,
      name: m.name || 'Arrêt OSM',
      kind: 'stop',
      lat: m.lat,
      lng: m.lng,
      polygon: null,
      source: 'overpass',
      importedAt: admin.firestore.FieldValue.serverTimestamp(),
    }, { merge: true });
    if (++n % 400 === 0) { await batch.commit(); batch = db.batch(); }
    added++;
  }
  await batch.commit();
  console.log(`${added} arrêts OSM ajoutés au catalogue`);
}
