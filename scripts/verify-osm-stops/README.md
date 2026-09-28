# Vérification arrêts OSM vs catalogue

Répond à : *"nos arrêts correspondent-ils à ceux de la map ?"*
en comparant les arrêts de bus OpenStreetMap (Overpass, gratuit sans clé)
au catalogue Firestore `stops`.

## Lancement

```powershell
cd scripts/verify-osm-stops
npm install
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\secrets\mobility-admin.json"
node verify.mjs
```

- Découpe Abidjan en cellules et interroge Overpass
  (`highway=bus_stop`, `public_transport=platform`, `amenity=bus_station`).
- Affiche : **correspondances** (même `osmId` des deux côtés),
  **absents du catalogue** (candidats OSM, 50 premiers en console),
  **orphelins** (chez nous, plus sur OSM).
- Rapport complet : `rapport-osm.json` (ignoré par git, régénérable).
- Options : `--bbox minLng,minLat,maxLng,maxLat`, `--cell 0.1`.

## Ajouter les manquants

```powershell
node verify.mjs --apply
```

Ajoute les absents dans `stops` (`kind=stop`, `source=overpass`,
nom OSM ou *"Arrêt OSM"*). Ensuite : complétez `line-stops.json`
(import-sotra-stops) pour les rattacher aux lignes, puis `enrich`.

## Note fair-use

Pauses entre requêtes + timeouts intégrés. Ne pas descendre `--cell`
sous 0.05 sans raison (multiplie les appels).
