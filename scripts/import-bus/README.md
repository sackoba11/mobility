# Import des lignes SOTRA + rattachement aux arrêts

Importe `bus.json` (liste officielle : 236 variantes, 105 numéros) dans
Firestore, puis écrit les `roadMap` des variantes avec les vrais arrêts.

## 1. Import des lignes

```powershell
cd scripts/import-bus
npm install
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\secrets\mobility-admin.json"
node import.mjs --input "C:\Users\Sackoba\Downloads\bus.json"
```

Crée `bus/{line}_{direction}_{n}` (ex. `201_aller_1`, `206_aller_2`) :
`{number, lineLabel, category, direction, variantIndex, source,
destination, isActive:false, roadMap:[], stopIds:[], routeGeometry:null,
position:null, driverUid:null, startDate:null, lastSeen:null}`.

- `number` : int (`"02"` -> `2`, compat `activeBus` + recherche).
- `lineLabel` : affichage fidèle (`"02"`, `"201"`, `"610"`).
- Relançable (merge + compteurs créés/mis à jour).

## 2. Rattachement aux arrêts

Le fichier source ne dit pas quelle variante dessert quel arrêt : décrivez-le.

```powershell
Copy-Item line-stops.template.json line-stops.json
# Renseignez les ids de docs `stops` DANS L'ORDRE de chaque variante
node enrich-bus.mjs
```

- Écrit `roadMap: [{lat, lng, label, osmId}]` (embarquée : timeline +
  carte sans lecture supplémentaire) et `stopIds: [osmId, ...]`
  (requêtes `arrayContains` : "bus par ici").
- **Supprime** `routeGeometry`/`routedAt` (tracé devenu faux).

## 3. Recalcul des tracés

```powershell
cd ..\backfill-route-geometry
# (voir son README) npm run backfill
```

Ordre global : **import → enrich → backfill**. Les règles Firestore
autorisent déjà la lecture publique de `bus` et `stops`
(voir `firestore.rules`) ; pensez à les redéployer après modification.

> L'ancienne collection `listBus` n'est plus lue par l'app : elle peut
> être supprimée dans la console une fois `bus` en place.
