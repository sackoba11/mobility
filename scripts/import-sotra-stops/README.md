# Import catalogue SOTRA + rattachement aux lignes

Importe `excel-to-json.json` (arrêts/gares OSM) dans Firestore, puis écrit
les `roadMap` des bus avec les vrais noms d'arrêts.

## 1. Import du catalogue

```powershell
cd scripts/import-sotra-stops
npm install
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\secrets\mobility-admin.json"
node import.mjs --input "C:\Users\Sackoba\Desktop\Sackoba\mobility docs\Sotra\excel-to-json.json"
```

Crée `stops/{node_xxx,way_xxx}` : `{osmId, name, kind, lat, lng, polygon?}`.
- `kind` : `gare` (Gare SOTRA), `boat` (bateau), `stop` (arrêt).
- `lat/lng` : point OSM ou **centroïde** du polygone (gares).
- `polygon` : anneau en `[{lng, lat}, ...]` (objets, car Firestore refuse
  les tableaux imbriqués) — dessin futur sur carte.
- Relançable (merge + compteurs créés/mis à jour).

## 2. Rattachement aux lignes

Le fichier source ne dit pas quel bus dessert quel arrêt : décrivez-le.

```powershell
Copy-Item line-stops.template.json line-stops.json
# Renseignez les ids de docs `stops` DANS L'ORDRE de chaque ligne
node enrich-libus.mjs
```

- Écrit `roadMap: [{lat, lng, label, osmId}]` dans les docs `listBus`
  du numéro (labels affichés dans la timeline + infobulles carte).
- **Supprime** `routeGeometry`/`routedAt` (tracé devenu faux).
- Lignes à < 2 arrêts résolus : ignorées avec un message.

## 3. Recalcul des tracés

```powershell
cd ..\backfill-route-geometry
# (voir son README) npm run backfill
```

Ordre global : **import → enrich → backfill**. Les règles Firestore
autorisent déjà la lecture publique de `stops` (voir `firestore.rules`) ;
pensez à les redéployer après toute modification.
