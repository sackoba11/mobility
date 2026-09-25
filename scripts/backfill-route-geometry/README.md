# Backfill des tracés de lignes (une seule fois)

Calcule le tracé routier de chaque bus `listBus` via Mapbox et le stocke
dans `routeGeometry`. Après ça, **l'app n'appelle plus Mapbox au runtime**
(quelques dizaines de requêtes au total, dans le palier gratuit).

## Pré-requis

1. Node.js 18+ :
   ```powershell
   cd scripts/backfill-route-geometry
   npm install
   ```
2. Clé de compte de service (bypass les règles Firestore) :
   console Firebase > Paramètres du projet > Comptes de service >
   **Générer une nouvelle clé privée** → fichier JSON à mettre **hors git**
   (ex. `C:\secrets\mobility-admin.json`).
3. Token Mapbox (`.env` racine, `MAPBOX_PUBLIC_TOKEN`).

## Lancement (PowerShell)

```powershell
$env:MAPBOX_TOKEN="<token>"
$env:GOOGLE_APPLICATION_CREDENTIALS="C:\secrets\mobility-admin.json"
cd scripts/backfill-route-geometry
npm run backfill
```

- Ne traite que les docs **sans** `routeGeometry` (relançable sans risque).
- `--force` (`npm run backfill:force`) : recalcule tout.

## Vérification

Console Firestore > `listBus` > un doc : champ `routeGeometry`
(tableau de `[lng, lat]`) + `routedAt` renseignés. Puis dans l'app :
ouvrir le détail d'un bus **sans connexion Mapbox possible** (ou avec un
token invalide) → le tracé s'affiche quand même.
