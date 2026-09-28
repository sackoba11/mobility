// Rattache les arrêts du catalogue aux lignes de bus.
//
// Le fichier excel-to-json ne dit pas QUEL bus dessert QUEL arrêt :
// décrivez-le dans line-stops.json, ex. :
//   { "610": ["node_8758117810", "node_8758117811", ...] }
//
// Usage : node enrich-libus.mjs [--mapping ./line-stops.json]
//
// Pour chaque numéro : lit les stops (dans l'ordre du fichier), écrit
// roadMap: [{lat, lng, label, osmId}] dans les docs `listBus` de ce numéro.
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
const numbers = Object.keys(mapping);
if (numbers.length === 0) {
  console.error('line-stops.json vide : renseignez au moins une ligne.');
  process.exit(1);
}

// Charge tous les stops référencés en une fois.
const allIds = [...new Set(numbers.flatMap((n) => mapping[n]))];
const stopDocs = new Map();
for (let i = 0; i < allIds.length; i += 30) {
  const chunk = allIds.slice(i, i + 30);
  const refs = chunk.map((id) => db.collection('stops').doc(id));
  const snaps = await db.getAll(...refs);
  snaps.forEach((s, j) => { if (s.exists) stopDocs.set(chunk[j], s.data()); });
}

for (const numStr of numbers) {
  const number = parseInt(numStr, 10);
  const roadMap = [];
  for (const sid of mapping[numStr]) {
    const s = stopDocs.get(sid);
    if (!s) { console.log(`  ! stop inconnu: ${sid} (ligne ${numStr})`); continue; }
    roadMap.push({ lat: s.lat, lng: s.lng, label: s.name, osmId: s.osmId });
  }
  if (roadMap.length < 2) {
    console.log(`x ligne ${numStr}: moins de 2 arrêts résolus, ignorée`);
    continue;
  }
  const buses = await db.collection('listBus').where('number', '==', number).get();
  if (buses.empty) {
    console.log(`x ligne ${numStr}: aucun doc listBus avec ce numéro`);
    continue;
  }
  for (const doc of buses.docs) {
    await doc.ref.update({
      roadMap,
      routeGeometry: admin.firestore.FieldValue.delete(),
      routedAt: admin.firestore.FieldValue.delete(),
    });
    console.log(`+ ligne ${numStr}: ${roadMap.length} arrêts -> ${doc.id}`);
  }
}
console.log('Terminé. Relancez scripts/backfill-route-geometry pour les tracés.');
