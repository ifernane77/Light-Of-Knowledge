# Installation — Light of Knowledge

## Prérequis

Pour exécuter le projet en local, les outils suivants sont nécessaires :

* PHP
* MySQL
* Laragon ou XAMPP
* Git
* Visual Studio Code
* Un navigateur web

## Récupération du projet

Cloner le dépôt Git :

```powershell
git clone URL_DU_DEPOT
```

Puis accéder au dossier du projet :

```powershell
cd Light-Of-Knowledge
```

## Structure actuelle

Le site public actuellement développé se trouve dans le dossier `public/`.

Le fichier principal de l'interface publique est :

```text
public/index.html
```

Les autres pages principales sont :

```text
public/formations.html
public/inscription.html
public/connexion.html
```

Le fichier `index.php` situé à la racine du projet est actuellement conservé comme page de vérification de l'environnement PHP. Il n'est pas encore relié au site public.

## Lancement du site public

Pour la partie HTML/CSS actuelle, le site peut être ouvert directement dans le navigateur à partir de :

```text
public/index.html
```

Il est également possible d'utiliser un serveur local.

## Test de PHP

Pour vérifier l'environnement PHP depuis la racine du projet :

```powershell
php -S localhost:8000
```

Puis ouvrir :

```text
http://localhost:8000
```

Cette adresse affiche actuellement la page de test `index.php` placée à la racine.

## Base de données

MySQL est disponible dans l'environnement local via Laragon.

Le schéma MariaDB V1 a été importé et testé dans phpMyAdmin avec XAMPP. Le traitement PHP des formulaires et leur connexion à la base restent à développer.

### Import de la base de démonstration MariaDB V1 avec XAMPP

1. Démarrer **Apache** et **MySQL** (MariaDB) dans le panneau XAMPP, puis ouvrir phpMyAdmin sur `http://localhost/phpmyadmin/`.
2. Si `light_of_knowledge` existe déjà, comparer les tables concernées avec le schéma V1 avant l'import. En cas d'écart, arrêter l'import. `CREATE TABLE IF NOT EXISTS` ne corrige pas une table existante. Pour retrouver les résultats attendus de la démonstration, utiliser une base locale dédiée initialement vide.
3. Depuis l'accueil de phpMyAdmin, ouvrir l'onglet **Importer**, choisir l'encodage UTF-8 et importer [01-schema.sql](sql/01-schema.sql). Ce fichier crée et sélectionne la base `light_of_knowledge`.
4. Sélectionner `light_of_knowledge` et importer [02-donnees-fictives.sql](sql/02-donnees-fictives.sql), réservé aux tests locaux.
5. Exécuter les requêtes de [03-tests.sql](sql/03-tests.sql) dans l'onglet **SQL** et noter les cinq compteurs du test 8. Réimporter les fichiers 01 puis 02 sans effacer la base et relancer les tests 1 à 8. Les compteurs et les résultats doivent rester identiques.
6. Exécuter les exemples négatifs du test 9 un par un, uniquement sur la base de démonstration. Renseigner [la fiche de validation](preuves/sql-validation.md) avec les résultats observés.

## Formulaires

Les formulaires d'inscription et de connexion présents dans `public/` sont actuellement des interfaces front-end.

Ils utilisent encore `action="#"` et ne sont donc pas reliés à un traitement PHP ni à une base de données.

## Environnement local utilisé

- PHP 8.3.16
- MySQL 8.4.3
- Laragon
- Visual Studio Code
- Git
- GitHub
- Navigateur web

## Sauvegarde du projet

Le code source est versionné avec Git.

Les commits permettent de conserver l'historique des modifications réalisées sur le projet.

Une copie distante du dépôt est conservée sur GitHub.

## Vérification de l'environnement

Un script PowerShell permet de vérifier rapidement l'environnement local :

```powershell
.\scripts\check-environment.ps1
```
