# m164 — Environnement de TP

MariaDB 11.4 et Adminer (interface web). La base de démonstration `ecole` est
préchargée ; vous créerez vous-même la base `sprintboard`, le fil rouge du
cours. PostgreSQL 17 est en réserve (profil `complet`), activé dès la S06.

```bash
docker compose up -d     # démarrer MariaDB + Adminer (dès la S01)
docker compose ps        # voir l'état des conteneurs
docker compose down      # arrêter (les données persistent)
docker compose down -v   # réinitialiser complètement (efface TOUT, recharge ecole)
```

Dès la S06, pour ajouter PostgreSQL :

```bash
docker compose --profile complet up -d
```

## Connexions (identifiants de lab uniquement)

| Service | Accès | Utilisateur | Mot de passe |
|---------|-------|-------------|--------------|
| Adminer | <http://localhost:8080> | `apprenti` | `m164lab` |
| MariaDB | `localhost:3306` | `apprenti` | `m164lab` |
| PostgreSQL (dès S06) | `localhost:5432` | `apprenti` | `m164lab` |

Dans Adminer : système **MySQL / MariaDB** (ou **PostgreSQL**), serveur
`mariadb` (ou `postgres`) — le nom du service Docker, pas `localhost`.

L'utilisateur `apprenti` peut **créer et supprimer toute base dont le nom
commence par `sprintboard`** (`sprintboard`, `sprintboard_test`…) et utilise
librement `ecole`. L'utilisateur d'administration `root` (mot de passe
`m164lab`) n'est utile que pour gérer des utilisateurs (S17).

En ligne de commande :

```bash
docker exec -it m164-mariadb mariadb -u apprenti -pm164lab
```

```bash
docker exec -it m164-postgres psql -U apprenti -d postgres
```

## Contenu du dossier

- `docker-compose.yml` — les services du lab
- `init/mariadb/00-droits.sql` — droits d'`apprenti` sur les bases `sprintboard*`
- `init/mariadb/01-ecole.sql`, `init/postgres/01-ecole.sql` — base de démonstration
  `ecole` (classes, élèves). Les scripts d'initialisation ne s'exécutent qu'au
  **premier** démarrage du volume (sinon : `docker compose down -v`).
- `reference/` — **corrigé de référence** du schéma SprintBoard (MariaDB et
  PostgreSQL). Il n'est remis aux élèves qu'à la fin de la S10, après la
  sommative.
