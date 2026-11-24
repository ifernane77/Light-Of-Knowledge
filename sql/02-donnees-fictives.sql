USE light_of_knowledge;

-- WHERE NOT EXISTS ajoute uniquement les lignes manquantes.
INSERT INTO roles (code)
SELECT 'administrateur' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE code = 'administrateur');

INSERT INTO roles (code)
SELECT 'professeur' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE code = 'professeur');

INSERT INTO roles (code)
SELECT 'eleve' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE code = 'eleve');

INSERT INTO formations (code, titre, description, tarif)
SELECT 'essentiels-option-1', 'Les Essentiels de l''Islam — Option 1',
       'Programme essentiel, avec accès au cours gratuit.', 300.00
WHERE NOT EXISTS (SELECT 1 FROM formations WHERE code = 'essentiels-option-1');

INSERT INTO formations (code, titre, description, tarif)
SELECT 'essentiels-option-2', 'Les Essentiels de l''Islam — Option 2',
       'Programme de l''option 1, complété par les règles du Nikāḥ et du Ṭalāq.', 350.00
WHERE NOT EXISTS (SELECT 1 FROM formations WHERE code = 'essentiels-option-2');

INSERT INTO formations (code, titre, description, tarif)
SELECT 'caractere-islamique', 'Développer un caractère islamique',
       'Cours gratuit accessible directement.', 0.00
WHERE NOT EXISTS (SELECT 1 FROM formations WHERE code = 'caractere-islamique');

-- Comptes fictifs pour les tests SQL locaux. Hashes bcrypt générés avec PHP.
INSERT INTO utilisateurs (prenom, nom, email, mot_de_passe_hash)
SELECT 'Lina', 'Exemple', 'lina@example.test',
       '$2y$10$T0OrrfgL.qDwAunhKixlhu6XEl/JR/6AKMQjqqPqf7LAeKk.Vt3g6'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'lina@example.test');

INSERT INTO utilisateurs (prenom, nom, email, mot_de_passe_hash)
SELECT 'Nora', 'Exemple', 'nora@example.test',
       '$2y$10$kIYSngnLD638z83qc/ut/.TQBYrZd6xWj5DNOgkwjv5tWjEOtiWKy'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'nora@example.test');

INSERT INTO utilisateurs (prenom, nom, email, mot_de_passe_hash)
SELECT 'Samia', 'Exemple', 'samia@example.test',
       '$2y$10$ZLoIbSEwMlgfRtHChVh0gu1LIqJNmkbHqgUW1x3vOfeg1OFU2A0qm'
WHERE NOT EXISTS (SELECT 1 FROM utilisateurs WHERE email = 'samia@example.test');

-- Retrouver les identifiants par e-mail et code.
INSERT INTO utilisateur_roles (utilisateur_id, role_id)
SELECT u.id, r.id
FROM utilisateurs AS u
JOIN roles AS r ON r.code IN ('administrateur', 'professeur')
WHERE u.email = 'lina@example.test'
  AND NOT EXISTS (
      SELECT 1 FROM utilisateur_roles AS ur
      WHERE ur.utilisateur_id = u.id AND ur.role_id = r.id
  );

INSERT INTO utilisateur_roles (utilisateur_id, role_id)
SELECT u.id, r.id
FROM utilisateurs AS u
JOIN roles AS r ON r.code = 'eleve'
WHERE u.email IN ('nora@example.test', 'samia@example.test')
  AND NOT EXISTS (
      SELECT 1 FROM utilisateur_roles AS ur
      WHERE ur.utilisateur_id = u.id AND ur.role_id = r.id
  );

INSERT INTO inscriptions (utilisateur_id, formation_id, statut)
SELECT u.id, f.id, 'en_attente'
FROM utilisateurs AS u
JOIN formations AS f ON f.code = 'essentiels-option-1'
WHERE u.email = 'nora@example.test'
  AND NOT EXISTS (
      SELECT 1 FROM inscriptions AS i
      WHERE i.utilisateur_id = u.id AND i.formation_id = f.id
  );

INSERT INTO inscriptions (utilisateur_id, formation_id, statut)
SELECT u.id, f.id, 'validee'
FROM utilisateurs AS u
JOIN formations AS f ON f.code = 'essentiels-option-2'
WHERE u.email = 'samia@example.test'
  AND NOT EXISTS (
      SELECT 1 FROM inscriptions AS i
      WHERE i.utilisateur_id = u.id AND i.formation_id = f.id
  );

INSERT INTO inscriptions (utilisateur_id, formation_id, statut)
SELECT u.id, f.id, 'annulee'
FROM utilisateurs AS u
JOIN formations AS f ON f.code = 'essentiels-option-1'
WHERE u.email = 'samia@example.test'
  AND NOT EXISTS (
      SELECT 1 FROM inscriptions AS i
      WHERE i.utilisateur_id = u.id AND i.formation_id = f.id
  );
