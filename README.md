# epai-m164 — Créer des bases de données et y insérer des données

Cours du module ICT 164 pour apprenti·e·s informaticien·ne·s CFC.
**Tous les supports** sont publiés ici, session après session : théorie,
présentations, exercices et jeux de données.

Fil rouge : vous construisez la base de données de **SprintBoard**, l'outil de
gestion de projets agiles de l'entreprise fictive **Pixelwerk SA** (Fribourg).

## Avant de commencer (session 1)

1. Installez Git.
2. Installez Docker (Docker Desktop sous Windows et macOS, Docker Engine sous Linux).
3. Clonez ce dépôt : `git clone https://github.com/cedricdumontmint/epai-m164.git`
4. Installez un éditeur Markdown pour vos notes : [MarkFlowy](https://github.com/drl990114/MarkFlowy/releases) (libre, mode WYSIWYG ; tout éditeur de texte convient aussi).

Aucun compte n'est nécessaire : ce dépôt est public. À chaque session : `git pull`
pour récupérer les nouveaux documents. **Ne modifiez pas cette copie** : copiez un
fichier ailleurs avant de le changer.

À la **session 5**, quand vous écrirez votre premier script SQL, vous créerez votre propre
dépôt personnel (`epai-m164-travaux`) et vous y **relierez cette copie** : le cours restera
votre source (`upstream`, `git pull --no-edit`), et votre dépôt recevra votre travail
(`origin`, `git push`), dans le dossier `travaux/`.

## Organisation

- `sessions/sNN/` — pour chaque session : théorie (PDF), présentation (HTML,
  s'ouvre dans le navigateur), exercices (PDF) et fichiers de départ
- `data/sNN/` — jeux de données de la session
- `labs/` — l'environnement de TP : MariaDB, Adminer et PostgreSQL (Docker Compose)

## Lancer le lab

```bash
cd labs
docker compose up -d
```

Adminer : <http://localhost:8080> — utilisateur `apprenti`, mot de passe
`m164lab` (identifiants de lab, valables uniquement ici).

## Sessions publiées

- [`s01`](sessions/s01/)
- [`s02`](sessions/s02/)
- [`s03`](sessions/s03/)
