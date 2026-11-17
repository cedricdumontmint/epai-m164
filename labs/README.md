# m164 — Environnement de TP

MariaDB 11.4 et Adminer (interface web). La base de démonstration `ecole` est
préchargée ; vous créerez vous-même la base `sprintboard`, le fil rouge du
cours. PostgreSQL 17 et son client graphique **pgAdmin** sont en réserve (profil
`complet`) : facultatifs dès la S01 (exercices optionnels), utilisés dès la S06.

```bash
docker compose up -d     # démarrer MariaDB + Adminer (dès la S01)
docker compose ps        # voir l'état des conteneurs
docker compose down      # arrêter (les données persistent)
docker compose down -v   # réinitialiser complètement (efface TOUT, recharge ecole)
```

Pour ajouter PostgreSQL et pgAdmin (exercices optionnels de S01-S02, puis dès la S06) :

```bash
docker compose --profile complet up -d       # démarrer les quatre services
docker compose --profile complet stop        # les arrêter (les données persistent)
```

Sans `--profile complet`, `stop` et `down` ne concernent que MariaDB et Adminer.

## Connexions (identifiants de lab uniquement)

| Service | Accès | Utilisateur | Mot de passe |
|---------|-------|-------------|--------------|
| Adminer | <http://localhost:8080> | `apprenti` | `m164lab` |
| MariaDB | `localhost:3306` | `apprenti` | `m164lab` |
| PostgreSQL (facultatif, dès S06) | `localhost:5432` | `apprenti` | `m164lab` |
| pgAdmin (client de PostgreSQL) | <http://localhost:5050> | aucun (mode local) | `m164lab` à l'ouverture du serveur |

Dans Adminer : système **MySQL / MariaDB** (ou **PostgreSQL**), serveur
`mariadb` (ou `postgres`) — le nom du service Docker, pas `localhost`.

Dans pgAdmin : le serveur **m164-postgres** est déjà déclaré (fichier
`pgadmin/servers.json`) ; double-cliquez dessus et saisissez `m164lab`. pgAdmin
est en anglais par défaut. Si vous créez une base depuis `psql`, faites un clic
droit sur *Databases* → *Refresh* pour la voir apparaître.

L'utilisateur `apprenti` peut **créer et supprimer toute base dont le nom
commence par `sprintboard`** (`sprintboard`, `sprintboard_test`…) et utilise
librement `ecole`. L'utilisateur d'administration `root` (mot de passe
`m164lab`) n'est utile que pour gérer des utilisateurs (S17).

En ligne de commande :

```bash
docker exec -it m164-mariadb mariadb -u apprenti -pm164lab
```

```bash
docker exec -it m164-postgres psql -U apprenti -d ecole
```

Sous **Git Bash (Windows)**, ajoutez `winpty` devant `docker exec -it …`.

## Contenu du dossier

- `docker-compose.yml` — les services du lab
- `pgadmin/servers.json` — déclare le serveur `m164-postgres` dans pgAdmin
- `init/mariadb/00-droits.sql` — droits d'`apprenti` sur les bases `sprintboard*`
- `init/mariadb/01-ecole.sql`, `init/postgres/01-ecole.sql` — base de démonstration
  `ecole` (classes, élèves). Les scripts d'initialisation ne s'exécutent qu'au
  **premier** démarrage du volume (sinon : `docker compose down -v`).
- `memento/` — jeu d'essai du mémento SQL (quatre tables et deux CSV), monté dans les conteneurs
  sous `/memento` ; il sert à vérifier les exemples du mémento.
- `reference/` — **corrigé de référence** du schéma SprintBoard (MariaDB et
  PostgreSQL). Il n'est remis aux élèves qu'à la fin de la S10, après la
  sommative.
