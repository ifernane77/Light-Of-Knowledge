# Journal de bord — Light of Knowledge

Ce document conserve les principales étapes de développement du projet Light of Knowledge.

Il est mis à jour uniquement lorsqu'une évolution significative du projet le justifie.

---

## Semaines 1 à 9 — Initialisation du projet

### Objectif

Préparer le projet et son environnement avant le début du développement des fonctionnalités de l'application.

### Réalisations

* création du projet Light of Knowledge ;
* création du dépôt Git ;
* mise en place de l'arborescence initiale ;
* préparation de la documentation principale ;
* configuration et vérification de l'environnement PHP ;
* lancement de l'application avec le serveur de développement PHP ;
* vérification de MySQL via Laragon ;
* définition des rôles administrateur, professeur et élève ;
* première réflexion sur les droits associés aux différents utilisateurs ;
* ajout de procédures simples de dépannage de l'environnement local.

### Environnement vérifié

* PHP 8.3.16 ;
* MySQL 8.4.3 ;
* Laragon ;
* Visual Studio Code ;
* Git et GitHub.

### État du projet

L'environnement de développement est opérationnel.

La structure initiale est prête pour commencer progressivement le développement de l'application lorsque les notions nécessaires auront été étudiées.

---

## Semaines 15 à 16 — Développement de l'interface publique

### Objectif

Mettre en place une première version complète du site public en HTML et CSS avant de commencer la logique applicative en PHP.

### Réalisations

* création de la page d'accueil `public/index.html` ;
* création de la page `public/formations.html` ;
* création de la page `public/inscription.html` ;
* création de la page `public/connexion.html` ;
* création et structuration du fichier `public/css/style.css` ;
* mise en place d'une identité graphique basée sur le vert foncé, le doré et le crème ;
* ajout du logo principal et de versions adaptées avec fond transparent ;
* création d'un header et d'une navigation communs ;
* création d'un footer avec informations de contact ;
* mise en place de sections de présentation de l'institut, des formations, des valeurs et des appels à l'action ;
* utilisation de Flexbox et CSS Grid pour la mise en page ;
* ajout de media queries pour rendre le site responsive ;
* création des formulaires front-end d'inscription et de connexion ;
* ajout des tarifs des formations : 300 € pour l'option 1 et 350 € pour l'option 2 ;
* précision de la règle d'accès selon laquelle les options 1 et 2 donnent également accès au cours gratuit « Développer un caractère islamique » ;
* ajout de l'adresse e-mail de contact ;
* versionnement et sauvegarde des évolutions sur GitHub.

### Règles métier précisées

Trois rôles principaux restent définis :

* administrateur ;
* professeur ;
* élève.

Le rôle élève reste unique. Les futurs droits d'accès seront déterminés par les formations auxquelles l'élève est inscrit.

Deux types d'espaces élèves sont envisagés côté interface :

* espace élève gratuit ;
* espace élève payant.

Ces deux espaces ne correspondent pas à deux rôles différents, mais à des niveaux d'accès différents selon l'inscription de l'élève.

### État du projet

La première version de l'interface publique HTML/CSS est opérationnelle et responsive.

Les formulaires sont encore statiques et ne sont pas reliés à une base de données. Le traitement PHP, l'authentification, la gestion des inscriptions et les tableaux de bord seront développés plus tard, au rythme des notions étudiées.
