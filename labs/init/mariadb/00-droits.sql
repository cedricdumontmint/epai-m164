-- Droits de l'utilisateur de lab « apprenti » (identifiants de lab uniquement).
-- Il peut créer et détruire toute base dont le nom commence par « sprintboard »
-- (sprintboard, sprintboard_test, sprintboard_s05…) : c'est ce qui permet
-- d'écrire soi-même CREATE DATABASE en S05, sans passer par root.
-- La base « ecole » (démo de lecture) lui est attribuée par le lab.
GRANT ALL PRIVILEGES ON `sprintboard%`.* TO 'apprenti'@'%';
FLUSH PRIVILEGES;
