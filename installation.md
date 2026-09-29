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

La base de données applicative et les traitements associés seront intégrés ultérieurement au rythme des notions étudiées et des besoins du projet.

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
