-- Base de démonstration « ecole » (m164, dès S01) — version PostgreSQL
-- Chargée automatiquement au premier démarrage du conteneur.

CREATE TABLE classe (
    id          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom         VARCHAR(10) NOT NULL UNIQUE,
    salle       VARCHAR(10) NOT NULL,
    annee_debut SMALLINT    NOT NULL
);

CREATE TABLE eleve (
    id             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom            VARCHAR(50) NOT NULL,
    prenom         VARCHAR(50) NOT NULL,
    date_naissance DATE        NOT NULL,
    classe_id      INTEGER     NOT NULL,
    CONSTRAINT fk_eleve_classe FOREIGN KEY (classe_id) REFERENCES classe (id)
);

INSERT INTO classe (nom, salle, annee_debut) VALUES
    ('INF1a', 'B204', 2025),
    ('INF1b', 'B207', 2025),
    ('INF2a', 'C112', 2024);

INSERT INTO eleve (nom, prenom, date_naissance, classe_id) VALUES
    ('Rochat',  'Léa',    '2009-03-14', 1),
    ('Müller',  'Noah',   '2008-11-02', 1),
    ('Bianchi', 'Sofia',  '2009-07-25', 1),
    ('Favre',   'Mathis', '2008-01-19', 2),
    ('Steiner', 'Emma',   '2009-05-08', 2),
    ('Da Silva','Diego',  '2007-09-30', 3),
    ('Perret',  'Chloé',  '2007-12-11', 3);
