// Importe le catalogue arrêts/gares (export excel-to-json) vers Firestore.
//
// Usage :
//   1. npm install            (dans scripts/import-sotra-stops)
//   2. Clé de compte de service (bypass les règles) :
//      GOOGLE_APPLICATION_CREDENTIALS=/chemin/cle.json (jamais committée)
//   3. node import.mjs --input "/chemin/excel-to-json.json"
//
// Résultat : collection `stops`, un doc par entrée OSM :
//   {
//     osmId: "node/768587345", name: "Terminus 27 ...",
//     kind: "stop" | "gare" | "boat",
//     lat, lng,                       <- point ou centroïde du polygone
//     polygon: [[lng,lat],...] | null <- anneau des gares (affichage futur)
//   }
// Doc id Firestore : "node_768587345" (/ interdit dans les ids).
// Relançable : écrit en merge, compte les créés vs mis à jour.
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const PROJECT_ID = 'mobilityplus-74105';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

const INPUT = arg('--input');
if (!INPUT) {
  console.error('Usage: node import.mjs --input "/chemin/excel-to-json.json"');
  process.exit(1);
}

function kindOf(categorie) {
  const c = (categorie ?? '').toLowerCase();
  if (c.includes('gare')) return 'gare';
  if (c.includes('bateau')) return 'boat';
  return 'stop';
}

function centroid(ring) {
  let sx = 0, sy = 0;
  for (const [lng, lat] of ring) { sx += lng; sy += lat; }
  return { lng: sx / ring.length, lat: sy / ring.length };
}

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  projectId: PROJECT_ID,
});
const db = admin.firestore();

const raw = JSON.parse(await readFile(INPUT, 'utf8'));
const rows = Array.isArray(raw) ? raw : raw.Feuil1 ?? [];
console.log(`${rows.length} entrées à importer depuis ${INPUT}`);

let batch = db.batch();
let pending = 0, created = 0, updated = 0, skipped = 0;
async function flush() {
  if (pending === 0) return;
  await batch.commit();
  batch = db.batch();
  pending = 0;
}

for (const row of rows) {
  const osmId = row.id ?? row['@id'];
  const name = (row.Lieu ?? '').toString().trim();
  let geo = null;
  try { geo = JSON.parse(row.geometry); } catch { geo = null; }
  if (!osmId || !name || !geo) { skipped++; continue; }

  let lat, lng, polygon = null;
  if (geo.type === 'Point' && Array.isArray(geo.coordinates)) {
    [lng, lat] = geo.coordinates;
  } else if (geo.type === 'Polygon' && Array.isArray(geo.coordinates?.[0])) {
    const ring = geo.coordinates[0];
    if (ring.length < 3) { skipped++; continue; }
    ({ lng, lat } = centroid(ring));
    // Firestore interdit les tableaux imbriqués : objets {lng,lat}.
    polygon = ring
      .filter((p) => Array.isArray(p) && p.length >= 2)
      .map(([rlng, rlat]) => ({ lng: rlng, lat: rlat }));
  } else { skipped++; continue; }
  if (typeof lat !== 'number' || typeof lng !== 'number') { skipped++; continue; }

  const docId = String(osmId).replace('/', '_');
  const ref = db.collection('stops').doc(docId);
  const exists = (await ref.get()).exists;
  batch.set(ref, {
    osmId,
    name,
    kind: kindOf(row['Catégorie']),
    lat,
    lng,
    polygon,
    importedAt: admin.firestore.FieldValue.serverTimestamp(),
  }, { merge: true });
  pending++;
  exists ? updated++ : created++;
  if (pending >= 400) await flush();
}
await flush();
console.log(`Terminé: ${created} créés, ${updated} mis à jour, ${skipped} ignorés`);
