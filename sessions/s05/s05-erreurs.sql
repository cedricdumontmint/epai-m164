-- Script volontairement cassé : il contient 5 erreurs.
-- Rejouez-le, lisez le message d'erreur, corrigez, recommencez.
-- (Il travaille dans sprintboard_s05 : votre vraie base n'est pas touchée.)

DROP DATABASE IF EXISTS sprintboard_s05;
CREATE DATABASE sprintboard_s05 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE membre (
    id          INT UNSIGNED AUTO_INCREMENT,
    nom         VARCHAR,
    prenom      VARCHAR(60)
    email       VARCHAR(120),
    date_entree DATE,
    actif       BOOLEAN,
);
