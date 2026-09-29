// Importe les trajets Gbaka/Taxi (gbaka_taxi.json) vers Firestore.
//
// Chaque LIGNE du fichier = un trajet (gare départ -> gare arrivée).
// Un doc par trajet, id : `{type}_{commune-slug}_{n}`, ex. :
//   `gbaka_abobo_1`, `taxi_toutes-communes_42`
// (`n` = ordre d'apparition dans le fichier au sein du couple type+commune).
//
// Usage :
//   1. npm install            (dans scripts/import-stations)
//   2. Clé de compte de service (bypass les règles) :
//      GOOGLE_APPLICATION_CREDENTIALS=/chemin/cle.json (jamais committée)
//   3. node import.mjs --input "/chemin/gbaka_taxi.json"
//
// Doc créé :
//   {
//     type: "Gbaka" | "Taxi",
//     commune: "Abobo",
//     departure: "Abobo Gare Mairie", arrival: "Adjamé Liberté",
//     departureLocation: null, arrivalLocation: null,
//       <- remplis par geocode-stations.mjs ({lat, lng, label})
//     roadMap: []
//   }
//
// Relançable : écrit en merge (set + {merge:true}), compte créés/mis à jour.
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const PROJECT_ID = 'mobilityplus-74105';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

function slug(s) {
  return (s ?? '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '') || 'sans-commune';
}

const INPUT = arg('--input');
if (!INPUT) {
  console.error('Usage: node import.mjs --input "/chemin/gbaka_taxi.json"');
  process.exit(1);
}

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  projectId: PROJECT_ID,
});
const db = admin.firestore();

const raw = JSON.parse(await readFile(INPUT, 'utf8'));
const rows = Array.isArray(raw) ? raw : [];
if (rows.length === 0) {
  console.error('gbaka_taxi.json vide ou illisible.');
  process.exit(1);
}
console.log(`${rows.length} trajets à importer depuis ${INPUT}`);

const counters = new Map();
let batch = db.batch();
let pending = 0, created = 0, updated = 0, skipped = 0;
async function flush() {
  if (pending === 0) return;
  await batch.commit();
  batch = db.batch();
  pending = 0;
}

const existing = new Set((await db.collection('station').select().get()).docs.map((d) => d.id));

for (const row of rows) {
  const type = (row.type ?? '').toString().trim();
  const commune = (row.commune ?? '').toString().trim();
  const departure = (row.departure ?? '').toString().trim();
  const arrival = (row.arrival ?? '').toString().trim();
  if ((type !== 'Gbaka' && type !== 'Taxi') || !departure || !arrival) {
    skipped++;
    console.log(`  ! trajet ignoré (champs manquants): ${JSON.stringify(row)}`);
    continue;
  }
  const key = `${type}|${commune}`;
  const n = (counters.get(key) ?? 0) + 1;
  counters.set(key, n);
  const docId = `${type.toLowerCase()}_${slug(commune)}_${n}`;

  const doc = {
    type,
    commune,
    departure,
    arrival,
    departureLocation: null,
    arrivalLocation: null,
    roadMap: [],
  };
  if (existing.has(docId)) updated++; else { created++; existing.add(docId); }
  batch.set(db.collection('station').doc(docId), doc, { merge: true });
  pending++;
  if (pending >= 400) await flush();
}
await flush();
console.log(`Terminé : ${created} créés, ${updated} mis à jour, ${skipped} ignorés.`);
console.log('Ensuite : `node geocode-stations.mjs` pour les coordonnées.');
