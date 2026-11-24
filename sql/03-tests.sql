USE light_of_knowledge;

-- 1. Confirme que les cinq tables sont présentes.
SHOW TABLES;

-- 2. Vérifie les trois offres actives à 0,00 €, 300,00 € et 350,00 €.
SELECT code, titre, tarif, actif FROM formations ORDER BY tarif;

-- 3. Vérifie les codes administrateur, eleve et professeur.
SELECT code FROM roles ORDER BY code;

-- 4. Vérifie que Lina a deux rôles et que Nora et Samia ont le rôle eleve.
SELECT u.email, r.code AS role
FROM utilisateurs AS u
JOIN utilisateur_roles AS ur ON ur.utilisateur_id = u.id
JOIN roles AS r ON r.id = ur.role_id
ORDER BY u.email, r.code;

-- 5. Vérifie les liens et statuts : Nora option 1 en attente,
-- Samia option 1 annulée et Samia option 2 validée.
SELECT u.email, f.code AS formation, i.statut
FROM inscriptions AS i
JOIN utilisateurs AS u ON u.id = i.utilisateur_id
JOIN formations AS f ON f.id = i.formation_id
ORDER BY u.email, f.code;

-- 6. Compte les demandes, tous statuts confondus : gratuit 0, option 1 = 2, option 2 = 1.
SELECT f.code, COUNT(i.id) AS nombre_inscriptions
FROM formations AS f
LEFT JOIN inscriptions AS i ON i.formation_id = f.id
GROUP BY f.code
ORDER BY f.code;

-- 7. Vérifie les quatre clés étrangères et leurs colonnes de destination.
SELECT table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'light_of_knowledge'
  AND referenced_table_name IS NOT NULL
ORDER BY table_name, column_name;

-- 8. Compare ces compteurs avant et après un second import de 01 et 02.
-- Sur la base de démonstration, les valeurs doivent rester 3, 3, 4, 3, 3.
USE light_of_knowledge;

SELECT
    (SELECT COUNT(*) FROM light_of_knowledge.utilisateurs) AS utilisateurs,
    (SELECT COUNT(*) FROM light_of_knowledge.roles) AS roles,
    (SELECT COUNT(*) FROM light_of_knowledge.utilisateur_roles) AS utilisateur_roles,
    (SELECT COUNT(*) FROM light_of_knowledge.formations) AS formations,
    (SELECT COUNT(*) FROM light_of_knowledge.inscriptions) AS inscriptions;

-- 9. Tests négatifs à copier individuellement dans l'onglet SQL après le premier import.
-- Exécuter uniquement sur la base locale de démonstration.
-- Chaque INSERT ci-dessous doit échouer sur le schéma attendu.

-- 9a. Un e-mail déjà présent doit être refusé (erreur 1062).
-- INSERT INTO utilisateurs (prenom, nom, email, mot_de_passe_hash)
-- SELECT prenom, nom, email, mot_de_passe_hash FROM utilisateurs
-- WHERE email = 'lina@example.test';

-- 9b. Un code de rôle déjà présent doit être refusé (erreur 1062).
-- INSERT INTO roles (code) VALUES ('eleve');

-- 9c. Un quatrième code de rôle doit être refusé (contrainte CHECK).
-- INSERT INTO roles (code) VALUES ('visiteur');

-- 9d. Un code de formation déjà présent doit être refusé (erreur 1062).
-- INSERT INTO formations (code, titre, description, tarif)
-- SELECT code, titre, description, tarif FROM formations
-- WHERE code = 'essentiels-option-1';

-- 9e. Attribuer deux fois le même rôle au même compte doit échouer (erreur 1062).
-- INSERT INTO utilisateur_roles (utilisateur_id, role_id)
-- SELECT u.id, r.id FROM utilisateurs AS u
-- JOIN roles AS r ON r.code = 'administrateur'
-- WHERE u.email = 'lina@example.test';

-- 9f. Inscrire deux fois le même compte à la même formation doit échouer (erreur 1062).
-- INSERT INTO inscriptions (utilisateur_id, formation_id)
-- SELECT u.id, f.id FROM utilisateurs AS u
-- JOIN formations AS f ON f.code = 'essentiels-option-1'
-- WHERE u.email = 'nora@example.test';

-- 9g. Une inscription avec un utilisateur inexistant doit échouer (erreur 1452).
-- Vérifier d'abord que SELECT id FROM utilisateurs WHERE id = 0 ne renvoie aucune ligne.
-- INSERT INTO inscriptions (utilisateur_id, formation_id)
-- SELECT 0, id FROM formations WHERE code = 'caractere-islamique';

-- 9h. Attribuer un rôle inexistant doit échouer (erreur 1452).
-- Vérifier d'abord que SELECT id FROM roles WHERE id = 0 ne renvoie aucune ligne.
-- INSERT INTO utilisateur_roles (utilisateur_id, role_id)
-- SELECT id, 0 FROM utilisateurs WHERE email = 'lina@example.test';

-- 9i. Une inscription avec une formation inexistante doit échouer (erreur 1452).
-- Vérifier d'abord que SELECT id FROM formations WHERE id = 0 ne renvoie aucune ligne.
-- INSERT INTO inscriptions (utilisateur_id, formation_id)
-- SELECT id, 0 FROM utilisateurs WHERE email = 'nora@example.test';

-- 9j. Attribuer un rôle à un utilisateur inexistant doit échouer (erreur 1452).
-- Après la vérification de 9g, utiliser l'identifiant utilisateur 0.
-- INSERT INTO utilisateur_roles (utilisateur_id, role_id)
-- SELECT 0, id FROM roles WHERE code = 'eleve';
