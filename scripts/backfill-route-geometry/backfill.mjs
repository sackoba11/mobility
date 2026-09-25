// Backfill une fois les tracés des lignes de bus.
//
// Usage :
//   1. npm install            (dans scripts/backfill-route-geometry)
//   2. Compte de service Firebase (rôle Datastore User ou Éditeur) :
//      console Firebase > Paramètres > Comptes de service > Générer une clé.
//      NE JAMAIS COMMITTER ce JSON (voir .gitignore).
//   3. MAPBOX_TOKEN=<token> GOOGLE_APPLICATION_CREDENTIALS=/chemin/cle.json \
//        npm run backfill [-- --force]
//
// Comportement : pour chaque doc `listBus` sans `routeGeometry` (ou tous
// avec --force), appelle Mapbox Directions sur les arrêts `roadMap` puis
// écrit `routeGeometry: [[lng,lat],...]` + `routedAt`. Après ça, l'app
// n'appelle plus jamais Mapbox au runtime.
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const MAPBOX_TOKEN = process.env.MAPBOX_TOKEN;
const FORCE = process.argv.includes('--force');
const PROJECT_ID = 'mobilityplus-74105';

if (!MAPBOX_TOKEN) {
  console.error('MAPBOX_TOKEN manquant (export MAPBOX_TOKEN=...)');
  process.exit(1);
}

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  projectId: PROJECT_ID,
});

const db = admin.firestore();
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function fetchGeometry(stops) {
  const coords = stops
    .filter((s) => typeof s.lat === 'number' && typeof s.long === 'number')
    .map((s) => `${s.long},${s.lat}`)
    .join(';');
  const url =
    `https://api.mapbox.com/directions/v5/mapbox/driving/${coords}` +
    `?steps=false&geometries=geojson&overview=full&access_token=${MAPBOX_TOKEN}`;
  const res = await fetch(url);
  if (!res.ok) throw new Error(`Mapbox ${res.status}`);
  const body = await res.json();
  const coordinates = body?.routes?.[0]?.geometry?.coordinates;
  if (!Array.isArray(coordinates) || coordinates.length < 2) {
    throw new Error('géométrie vide');
  }
  return coordinates;
}

const snap = await db.collection('listBus').get();
console.log(`${snap.size} docs listBus, mode=${FORCE ? 'force' : 'manquants'}`);

let ok = 0, skipped = 0, failed = 0;
for (const doc of snap.docs) {
  const data = doc.data();
  if (!FORCE && Array.isArray(data.routeGeometry) && data.routeGeometry.length >= 2) {
    skipped++;
    continue;
  }
  const stops = Array.isArray(data.roadMap) ? data.roadMap : [];
  if (stops.length < 2) {
    console.log(`- ${doc.id} (${data.number}): roadMap insuffisant, ignoré`);
    failed++;
    continue;
  }
  try {
    const geometry = await fetchGeometry(stops);
    await doc.ref.update({
      routeGeometry: geometry,
      routedAt: admin.firestore.FieldValue.serverTimestamp(),
    });
    ok++;
    console.log(`+ ${doc.id} (${data.number ?? '?'}): ${geometry.length} points`);
  } catch (e) {
    failed++;
    console.log(`x ${doc.id} (${data.number ?? '?'}): ${e.message}`);
  }
  await sleep(300); // limite de débit Mapbox
}

console.log(`Terminé: ${ok} ok, ${skipped} déjà faits, ${failed} en échec`);
process.exit(failed > 0 ? 1 : 0);
