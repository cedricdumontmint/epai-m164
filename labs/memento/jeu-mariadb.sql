DROP DATABASE IF EXISTS sprintboard_memento;
CREATE DATABASE sprintboard_memento CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sprintboard_memento;

CREATE TABLE projet (
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom        VARCHAR(80) NOT NULL,
    date_debut DATE        NOT NULL,
    statut     VARCHAR(12) NOT NULL DEFAULT 'planifie',
    CONSTRAINT chk_projet_statut
        CHECK (statut IN ('planifie', 'en_cours', 'termine', 'archive'))
);

CREATE TABLE membre (
    id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom         VARCHAR(60)  NOT NULL,
    prenom      VARCHAR(60)  NOT NULL,
    email       VARCHAR(120) NOT NULL,
    date_entree DATE         NOT NULL,
    actif       BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_membre_email UNIQUE (email)
);

CREATE TABLE participation (
    membre_id INT UNSIGNED NOT NULL,
    projet_id INT UNSIGNED NOT NULL,
    role      VARCHAR(20)  NOT NULL,
    PRIMARY KEY (membre_id, projet_id),
    CONSTRAINT fk_part_membre FOREIGN KEY (membre_id)
        REFERENCES membre (id) ON DELETE CASCADE,
    CONSTRAINT fk_part_projet FOREIGN KEY (projet_id)
        REFERENCES projet (id) ON DELETE CASCADE
);

CREATE TABLE user_story (
    id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    projet_id INT UNSIGNED NOT NULL,
    titre     VARCHAR(100) NOT NULL,
    points    TINYINT UNSIGNED,
    statut    VARCHAR(12)  NOT NULL DEFAULT 'backlog',
    assigne_a INT UNSIGNED,
    CONSTRAINT fk_story_projet FOREIGN KEY (projet_id)
        REFERENCES projet (id) ON DELETE RESTRICT,
    CONSTRAINT fk_story_membre FOREIGN KEY (assigne_a)
        REFERENCES membre (id) ON DELETE SET NULL
);

INSERT INTO projet (nom, date_debut, statut) VALUES
    ('Portail Clients',          '2026-09-07', 'en_cours'),
    ('App Mobile Cantine',       '2027-02-01', 'planifie'),
    ('Site Vitrine Boulangerie', '2026-11-02', 'planifie');

INSERT INTO membre (nom, prenom, email, date_entree, actif) VALUES
    ('Overney',  'Laure',   'laure.overney@pixelwerk.ch',  '2022-03-01', TRUE),
    ('Brülhart', 'Marc',    'marc.bruelhart@pixelwerk.ch', '2022-08-15', TRUE),
    ('Jaquet',   'Élodie',  'elodie.jaquet@pixelwerk.ch',  '2023-02-01', TRUE),
    ('Waeber',   'Camille', 'camille.waeber@pixelwerk.ch', '2024-05-13', FALSE);

INSERT INTO participation (membre_id, projet_id, role) VALUES
    (1, 1, 'cheffe de projet'), (2, 1, 'développeur'), (3, 1, 'designer'),
    (2, 2, 'développeur'),      (4, 2, 'designer');

INSERT INTO user_story (projet_id, titre, points, statut, assigne_a) VALUES
    (1, 'Se connecter au portail',        3,    'termine',  2),
    (1, 'Consulter mes factures',         5,    'en_cours', 2),
    (1, 'Télécharger une facture en PDF', 8,    'en_cours', 3),
    (1, 'Changer mon mot de passe',       2,    'backlog',  NULL),
    (1, 'Afficher le tableau de bord',    NULL, 'backlog',  NULL),
    (2, 'Voir le menu du jour',           3,    'en_cours', 4),
    (2, 'Commander un repas',             13,   'backlog',  NULL),
    (3, 'Page « Nos produits »',          5,    'backlog',  NULL);
