// Remplit departureLocation/arrivalLocation des docs `station` en
// rattachant chaque nom de lieu au catalogue `stops` (positions OSM).
//
// Usage : node geocode-stations.mjs [--threshold 90] [--apply]
//   Sans --apply : rapport seul (lieu -> candidat + score), rien n'est écrit.
//   Avec --apply : écrit {lat, lng, label} quand le meilleur score >= seuil.
//   --overrides ./geocode-overrides.json : rattachements manuels
//     {lieu: stopDocId} prioritaires (lieux ambigus arbitrés à la main).
//
// Les lieux sans candidat sont listés pour traitement manuel/Nominatim.
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const PROJECT_ID = 'mobilityplus-74105';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

const THRESHOLD = parseInt(arg('--threshold', '90'), 10);
const APPLY = process.argv.includes('--apply');
const OVERRIDES_PATH = arg('--overrides', './geocode-overrides.json');

let overrides = {};
try {
  overrides = JSON.parse(await readFile(OVERRIDES_PATH, 'utf8'));
  console.log(`Overrides : ${Object.keys(overrides).length} lieux arbitrés`);
} catch {
  console.log('Pas de fichier overrides (tous les rattachements sont auto).');
}

function norm(s) {
  return (s ?? '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim()
    .replace(/\s+/g, ' ');
}

const STOPWORDS = new Set(['arret', 'arrets', 'de', 'du', 'des', 'la', 'le', 'les', 'l', 'd', 'a', 'au', 'aux', 'en', 'et', 'st', 'saint', 'sainte', 'gare', 'terminus', 'carrefour']);
function tokens(s) {
  return norm(s).split(' ').filter((t) => t && !STOPWORDS.has(t));
}

function levenshtein(a, b) {
  const m = a.length, n = b.length;
  if (!m) return n;
  if (!n) return m;
  let prev = [...Array(n + 1).keys()];
  for (let i = 1; i <= m; i++) {
    const cur = [i];
    for (let j = 1; j <= n; j++) {
      cur[j] = Math.min(prev[j] + 1, cur[j - 1] + 1, prev[j - 1] + (a[i - 1] === b[j - 1] ? 0 : 1));
    }
    prev = cur;
  }
  return prev[n];
}

function score(want, got) {
  const nw = norm(want), ng = norm(got);
  if (!nw || !ng) return 0;
  if (nw === ng) return 100;
  if (ng.includes(nw) || nw.includes(ng)) {
    const short = Math.min(nw.length, ng.length);
    const long = Math.max(nw.length, ng.length);
    return Math.round(70 + (30 * short) / long);
  }
  const tw = new Set(tokens(want)), tg = new Set(tokens(got));
  if (tw.size === 0 || tg.size === 0) return 0;
  let inter = 0;
  for (const t of tw) if (tg.has(t)) inter++;
  if (inter === 0) return 0;
  const jaccard = inter / (tw.size + tg.size - inter);
  let s = Math.round(40 + 50 * jaccard);
  const dist = levenshtein(nw, ng);
  const maxLen = Math.max(nw.length, ng.length);
  if (dist <= 3 && maxLen > 0) s = Math.max(s, Math.round(60 + 30 * (1 - dist / 3)));
  return Math.min(s, 95);
}

admin.initializeApp({
  credential: admin.credential.applicationDefault(),
  projectId: PROJECT_ID,
});
const db = admin.firestore();

const snap = await db.collection('station').get();
console.log(`${snap.size} docs station`);
const places = new Set();
for (const d of snap.docs) {
  const data = d.data();
  if (data.departure) places.add(data.departure.trim());
  if (data.arrival) places.add(data.arrival.trim());
}
console.log(`${places.size} lieux distincts`);

const stopSnap = await db.collection('stops').select('name', 'lat', 'lng', 'osmId').get();
const catalog = stopSnap.docs.map((d) => ({ id: d.id, ...d.data() }));

const resolved = new Map();
const unresolved = [];
const byId = new Map(catalog.map((c) => [c.id, c]));
// 1. Overrides manuels (prioritaires, même sous le seuil).
for (const [place, stopId] of Object.entries(overrides)) {
  const stop = byId.get(stopId);
  if (!stop) {
    console.log(`  ! override inconnu: "${place}" -> ${stopId}`);
    unresolved.push({ place, score: 0, hint: `override invalide ${stopId}` });
    continue;
  }
  resolved.set(place, { stop, score: 101, ties: 1 });
}
// 2. Matching auto.
for (const place of [...places].sort()) {
  if (resolved.has(place)) continue;
  let best = null, bestScore = 0, ties = 0;
  for (const c of catalog) {
    const s = score(place, c.name ?? '');
    if (s > bestScore) { bestScore = s; best = c; ties = 1; }
    else if (s === bestScore && s > 0) { ties++; }
  }
  if (best && bestScore >= THRESHOLD) {
    resolved.set(place, { stop: best, score: bestScore, ties });
  } else {
    unresolved.push({ place, score: bestScore, hint: best ? `${best.id} "${best.name}"` : null });
  }
}

console.log(`\nRésolus (>= ${THRESHOLD}) : ${resolved.size}, non résolus : ${unresolved.length}`);
for (const u of unresolved) {
  console.log(`  ? "${u.place}" (meilleur: ${u.score}${u.hint ? ` -> ${u.hint}` : ''})`);
}

if (APPLY) {
  const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
  let batch = db.batch();
  let pending = 0, n = 0;
  for (const doc of snap.docs) {
    const data = doc.data();
    const patch = {};
    const dep = resolved.get((data.departure ?? '').trim());
    const arr = resolved.get((data.arrival ?? '').trim());
    if (dep && !data.departureLocation) {
      patch.departureLocation = { lat: dep.stop.lat, lng: dep.stop.lng, label: dep.stop.name };
    }
    if (arr && !data.arrivalLocation) {
      patch.arrivalLocation = { lat: arr.stop.lat, lng: arr.stop.lng, label: arr.stop.name };
    }
    if (Object.keys(patch).length > 0) {
      batch.update(doc.ref, patch);
      pending++;
      n++;
      if (pending >= 100) {
        await batch.commit();
        batch = db.batch();
        pending = 0;
        await sleep(1000); // limite de débit Firestore
      }
    }
  }
  if (pending > 0) await batch.commit();
  console.log(`\n${n} docs mis à jour.`);
} else {
  console.log('\nMode rapport (rien écrit). Relancez avec --apply pour écrire.');
}
process.exit(0);
