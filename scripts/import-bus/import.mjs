// Importe la liste officielle des lignes (bus.json) vers Firestore.
//
// Chaque LIGNE du fichier = une variante (sens + couple départ/arrivée).
// Un doc Firestore par variante, id : `{line}_{direction}_{n}`, ex. :
//   `201_aller_1`, `206_aller_2`, `02_retour_1`
// (`n` = ordre d'apparition dans bus.json au sein du couple ligne+direction).
//
// Usage :
//   1. npm install            (dans scripts/import-bus)
//   2. Clé de compte de service (bypass les règles) :
//      GOOGLE_APPLICATION_CREDENTIALS=/chemin/cle.json (jamais committée)
//   3. node import.mjs --input "/chemin/bus.json"
//
// Doc créé :
//   {
//     number: 2,                 <- int (compat activeBus, règles, recherche)
//     lineLabel: "02",           <- affichage fidèle SOTRA
//     category: "Monbus" | "Express" | "Monbus/Navette" | "Wibus",
//     direction: "aller" | "retour",
//     variantIndex: 1,
//     source: "Cité Fairmont", destination: "Gare Marcory",
//     isActive: false,
//     roadMap: [], stopIds: [],  <- remplis par enrich-bus.mjs
//     routeGeometry: null,       <- rempli par backfill-route-geometry
//     position: null, driverUid: null, startDate: null, lastSeen: null
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

const INPUT = arg('--input');
if (!INPUT) {
  console.error('Usage: node import.mjs --input "/chemin/bus.json"');
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
  console.error('bus.json vide ou illisible.');
  process.exit(1);
}
console.log(`${rows.length} variantes à importer depuis ${INPUT}`);

// Compte les variantes dans l'ordre du fichier : n par (ligne, direction).
const counters = new Map();
let batch = db.batch();
let pending = 0, created = 0, updated = 0, skipped = 0;
async function flush() {
  if (pending === 0) return;
  await batch.commit();
  batch = db.batch();
  pending = 0;
}

const existing = new Set((await db.collection('bus').select().get()).docs.map((d) => d.id));

for (const row of rows) {
  const lineLabel = (row.line_number ?? '').toString().trim();
  const direction = (row.direction ?? '').toString().trim().toLowerCase();
  const source = (row.departure ?? '').toString().trim();
  const destination = (row.arrival ?? '').toString().trim();
  const category = (row.category ?? '').toString().trim();
  const number = parseInt(lineLabel, 10);
  if (!lineLabel || Number.isNaN(number) || !source || !destination) {
    skipped++;
    console.log(`  ! ligne ignorée (champs manquants): ${JSON.stringify(row)}`);
    continue;
  }
  if (direction !== 'aller' && direction !== 'retour') {
    skipped++;
    console.log(`  ! direction inconnue "${row.direction}" pour la ligne ${lineLabel}`);
    continue;
  }
  const key = `${lineLabel}|${direction}`;
  const variantIndex = (counters.get(key) ?? 0) + 1;
  counters.set(key, variantIndex);
  const docId = `${lineLabel}_${direction}_${variantIndex}`;

  const doc = {
    number,
    lineLabel,
    category,
    direction,
    variantIndex,
    source,
    destination,
    isActive: false,
    roadMap: [],
    stopIds: [],
    routeGeometry: null,
    position: null,
    driverUid: null,
    startDate: null,
    lastSeen: null,
  };
  if (existing.has(docId)) updated++; else { created++; existing.add(docId); }
  batch.set(db.collection('bus').doc(docId), doc, { merge: true });
  pending++;
  if (pending >= 400) await flush();
}
await flush();
console.log(`Terminé : ${created} créés, ${updated} mis à jour, ${skipped} ignorés.`);
console.log('Ensuite : renseignez line-stops.json (ids de docs `bus` -> ids de docs `stops`)');
console.log("puis `node enrich-bus.mjs`, puis scripts/backfill-route-geometry pour les tracés.");
