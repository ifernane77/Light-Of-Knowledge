CREATE DATABASE IF NOT EXISTS light_of_knowledge
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE light_of_knowledge;

-- Un compte par adresse e-mail.
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(80) NOT NULL,
    nom VARCHAR(80) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    telephone VARCHAR(30) DEFAULT NULL,
    mot_de_passe_hash VARCHAR(255) NOT NULL,
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les codes correspondent aux constantes de includes/roles.php.
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT chk_roles_code CHECK (
        BINARY code IN ('administrateur', 'professeur', 'eleve')
    )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La clé primaire composée empêche d'attribuer deux fois le même rôle.
CREATE TABLE IF NOT EXISTS utilisateur_roles (
    utilisateur_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (utilisateur_id, role_id),
    CONSTRAINT fk_utilisateur_roles_utilisateur
        FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs (id),
    CONSTRAINT fk_utilisateur_roles_role
        FOREIGN KEY (role_id) REFERENCES roles (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS formations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    titre VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    tarif DECIMAL(7, 2) NOT NULL,
    actif INT NOT NULL DEFAULT 1,
    CONSTRAINT chk_formations_tarif CHECK (tarif >= 0),
    CONSTRAINT chk_formations_actif CHECK (actif IN (0, 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Une seule ligne par utilisateur et par formation.
CREATE TABLE IF NOT EXISTS inscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    formation_id INT NOT NULL,
    date_inscription DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('en_attente', 'validee', 'annulee') NOT NULL DEFAULT 'en_attente',
    CONSTRAINT chk_inscriptions_statut CHECK (statut IN ('en_attente', 'validee', 'annulee')),
    CONSTRAINT uq_inscriptions_utilisateur_formation UNIQUE (utilisateur_id, formation_id),
    CONSTRAINT fk_inscriptions_utilisateur
        FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs (id),
    CONSTRAINT fk_inscriptions_formation
        FOREIGN KEY (formation_id) REFERENCES formations (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
