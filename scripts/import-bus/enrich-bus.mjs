// Rattache les arrêts du catalogue aux variantes de lignes (`bus`).
//
// Décrivez dans line-stops.json, ex. :
//   { "610_aller_1": ["node_8758117810", "node_8758117811", ...] }
//
// Les CLÉS sont des ids de docs `bus` (voir import.mjs : `{line}_{direction}_{n}`),
// les VALEURS les ids de docs `stops` DANS L'ORDRE du trajet.
//
// Usage : node enrich-bus.mjs [--mapping ./line-stops.json]
//
// Pour chaque variante : lit les stops, écrit
//   roadMap: [{lat, lng, label, osmId}]  <- embarquée (timeline + carte, 0 lecture)
//   stopIds: ["node/..."]                <- requêtes arrayContains ("bus par ici")
// SUPPRIME aussi routeGeometry/routedAt (tracé précalculé devenu faux ;
// relancez scripts/backfill-route-geometry ensuite).
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const PROJECT_ID = 'mobilityplus-74105';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  projectId: PROJECT_ID,
});
const db = admin.firestore();

const mapping = JSON.parse(await readFile(arg('--mapping', './line-stops.json'), 'utf8'));
const docIds = Object.keys(mapping);
if (docIds.length === 0) {
  console.error('line-stops.json vide : renseignez au moins une variante.');
  process.exit(1);
}

// Charge tous les stops référencés en une fois.
const allIds = [...new Set(docIds.flatMap((d) => mapping[d]))];
const stopDocs = new Map();
for (let i = 0; i < allIds.length; i += 30) {
  const chunk = allIds.slice(i, i + 30);
  const refs = chunk.map((id) => db.collection('stops').doc(id));
  const snaps = await db.getAll(...refs);
  snaps.forEach((s, j) => { if (s.exists) stopDocs.set(chunk[j], s.data()); });
}

for (const docId of docIds) {
  const roadMap = [];
  const stopIds = [];
  for (const sid of mapping[docId]) {
    const s = stopDocs.get(sid);
    if (!s) { console.log(`  ! stop inconnu: ${sid} (variante ${docId})`); continue; }
    roadMap.push({ lat: s.lat, lng: s.lng, label: s.name, osmId: s.osmId });
    stopIds.push(s.osmId);
  }
  if (roadMap.length < 2) {
    console.log(`x variante ${docId}: moins de 2 arrêts résolus, ignorée`);
    continue;
  }
  const ref = db.collection('bus').doc(docId);
  const snap = await ref.get();
  if (!snap.exists) {
    console.log(`x variante ${docId}: aucun doc \`bus\` avec cet id`);
    continue;
  }
  await ref.update({
    roadMap,
    stopIds,
    routeGeometry: admin.firestore.FieldValue.delete(),
    routedAt: admin.firestore.FieldValue.delete(),
  });
  console.log(`+ variante ${docId}: ${roadMap.length} arrêts`);
}
console.log('Terminé. Relancez scripts/backfill-route-geometry pour les tracés.');
