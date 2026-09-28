// Propose un rattachement noms d'arrêts (stop-lists.json, transcrits des
// fiches SOTRA) -> ids de docs `stops` (catalogue OSM).
//
// Usage : node match-stops.mjs [--input ./stop-lists.json]
// Sortie : pour chaque nom, les 5 meilleurs candidats (score + id + coords).
// Ne modifie rien : le mapping validé va dans line-stops.json, appliqué
// ensuite par enrich-bus.mjs.
import { readFile } from 'node:fs/promises';
import admin from 'firebase-admin';

const PROJECT_ID = 'mobilityplus-74105';

function arg(name, fallback = null) {
  const i = process.argv.findIndex((a) => a === name || a.startsWith(name + '='));
  if (i === -1) return fallback;
  const a = process.argv[i];
  return a.includes('=') ? a.split('=').slice(1).join('=') : process.argv[i + 1] ?? fallback;
}

// Normalisation : minuscules, sans accents, ponctuation -> espace.
function norm(s) {
  return (s ?? '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim()
    .replace(/\s+/g, ' ');
}

const STOPWORDS = new Set(['arret', 'arrets', 'de', 'du', 'des', 'la', 'le', 'les', 'l', 'd', 'a', 'au', 'aux', 'en', 'et', 'st', 'saint', 'sainte']);
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

// Score 0-100 entre un nom recherché et un nom du catalogue.
function score(want, got) {
  const nw = norm(want), ng = norm(got);
  if (!nw || !ng) return 0;
  if (nw === ng) return 100;
  if (ng === `arret ${nw}` || ng === `${nw}`) return 99;
  // Inclusion : le plus petit contenu dans le plus grand.
  if (ng.includes(nw) || nw.includes(ng)) {
    const short = Math.min(nw.length, ng.length);
    const long = Math.max(nw.length, ng.length);
    return Math.round(70 + (30 * short) / long);
  }
  // Recouvrement de tokens significatifs.
  const tw = new Set(tokens(want)), tg = new Set(tokens(got));
  if (tw.size === 0 || tg.size === 0) return 0;
  let inter = 0;
  for (const t of tw) if (tg.has(t)) inter++;
  if (inter === 0) return 0;
  const jaccard = inter / (tw.size + tg.size - inter);
  let s = Math.round(40 + 50 * jaccard);
  // Bonus proximité orthographique sur le nom complet.
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

const lists = JSON.parse(await readFile(arg('--input', './stop-lists.json'), 'utf8'));
const snap = await db.collection('stops').select('name', 'lat', 'lng', 'kind', 'osmId').get();
const catalog = snap.docs.map((d) => ({ id: d.id, ...d.data() }));
console.log(`Catalogue : ${catalog.length} stops`);

for (const [variant, names] of Object.entries(lists)) {
  console.log(`\n=== ${variant} (${names.length} arrêts) ===`);
  for (const name of names) {
    const ranked = catalog
      .map((c) => ({ c, s: score(name, c.name ?? '') }))
      .filter((r) => r.s >= 40)
      .sort((a, b) => b.s - a.s)
      .slice(0, 5);
    if (ranked.length === 0) {
      console.log(`? "${name}" -> AUCUN CANDIDAT`);
    } else {
      const best = ranked.map((r) => `[${r.s}] ${r.c.id} "${r.c.name}" (${r.c.lat},${r.c.lng})`).join('\n      ');
      console.log(`- "${name}" ->\n      ${best}`);
    }
  }
}
process.exit(0);
