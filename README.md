# Light of Knowledge

Light of Knowledge est un projet personnel de développement d'une plateforme web responsive destinée à Light of Knowledge Institute France.

Le projet est développé progressivement en parallèle de ma formation en BTS SIO option SLAM. Les fonctionnalités sont ajoutées au rythme des notions étudiées durant la formation.

## Objectif

L'objectif est de construire progressivement une application permettant de présenter les formations de l'institut puis de gérer les utilisateurs, les cours, les ressources pédagogiques et le suivi des formations.

Trois rôles principaux sont prévus :

* administrateur ;
* professeur ;
* élève.

Le rôle `eleve` reste unique. Les différences entre un élève inscrit à une formation gratuite et un élève inscrit à une formation payante seront gérées par ses inscriptions et ses droits d'accès aux formations, et non par la création de rôles supplémentaires.

## Formations actuellement présentées

### Les Essentiels de l'Islam — Option 1

* tarif : 300 € ;
* programme essentiel ;
* accès également au cours « Développer un caractère islamique ».

### Les Essentiels de l'Islam — Option 2

* tarif : 350 € ;
* comprend le programme de l'option 1 ainsi qu'un enseignement supplémentaire sur les règles du Nikāḥ et du Ṭalāq ;
* accès également au cours « Développer un caractère islamique ».

### Développer un caractère islamique

* cours gratuit ;
* accessible directement ;
* également inclus pour les élèves inscrits aux options 1 et 2.

## Développement progressif

Le projet est organisé en plusieurs versions.

### V1 — Site public et espaces utilisateurs

Éléments déjà réalisés :

* page d'accueil ;
* page de présentation des formations ;
* page d'inscription ;
* page de connexion ;
* identité graphique du site ;
* mise en page responsive ;
* navigation entre les pages ;
* formulaires front-end ;
* définition initiale des rôles utilisateurs.

Éléments restant à développer progressivement :

* traitement PHP des formulaires ;
* base de données ;
* authentification ;
* gestion des inscriptions aux formations ;
* contrôle des droits d'accès ;
* tableau de bord administrateur ;
* tableau de bord professeur ;
* espace élève gratuit ;
* espace élève payant.

### V2 — Gestion des cours

* gestion des cours ;
* inscription des élèves aux cursus ;
* ressources pédagogiques ;
* liens vers les cours à distance ;
* replays.

### V3 — Examens et suivi pédagogique

* examens ;
* remise de travaux ;
* corrections et notes ;
* absences ;
* suivi pédagogique.

### V4 — Communication et améliorations

* communication interne ;
* partage de documents ;
* notifications ;
* statistiques ;
* automatisations ;
* amélioration de la sécurité et de l'interface.

## Technologies

Technologies et outils actuellement utilisés ou préparés :

* HTML5 ;
* CSS3 ;
* PHP 8.3.16 ;
* MySQL 8.4.3 via Laragon ;
* Git ;
* GitHub ;
* Visual Studio Code.

JavaScript et les fonctionnalités applicatives plus avancées seront intégrés progressivement lorsque cela sera nécessaire et en fonction des notions étudiées.

## Structure actuelle

Le site public se trouve dans le dossier `public/` :

* `public/index.html` — accueil ;
* `public/formations.html` — présentation des formations ;
* `public/inscription.html` — formulaire d'inscription ;
* `public/connexion.html` — formulaire de connexion ;
* `public/css/style.css` — styles du site ;
* `public/images/` — logos et visuels des formations.

Le fichier `index.php` situé à la racine correspond actuellement à une page de vérification de l'environnement PHP et n'est pas encore relié au site public.

## État actuel

La première version de l'interface publique HTML/CSS est opérationnelle.

Les formulaires d'inscription et de connexion sont pour l'instant uniquement des interfaces front-end : leur traitement côté serveur sera développé ultérieurement.
