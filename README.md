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
* définition initiale des rôles utilisateurs ;
* schéma MariaDB V1 réalisé et testé dans phpMyAdmin.

Éléments restant à développer progressivement :

* traitement PHP des formulaires ;
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
* MariaDB via XAMPP/phpMyAdmin (schéma V1 validé) ; MySQL 8.4.3 via Laragon utilisé initialement ;
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

## Périmètre E6 et feuille de route (session 2027)

**Positionnement : seconde réalisation E6 envisagée**, sous réserve de disposer d'une application fonctionnelle, démontrable et suffisamment documentée pour l'épreuve. Ce projet reste également un projet personnel destiné à évoluer au-delà du BTS.

**État confirmé à ce stade :** l'interface publique HTML/CSS responsive est opérationnelle ; les pages d'inscription et de connexion sont des formulaires front-end, sans authentification réelle.

### MVP applicatif visé (à développer)

1. **Persistance :** schéma MariaDB V1 réalisé pour les comptes, rôles, formations et inscriptions. Tests SQL 1 à 8 et réimportation sans doublon validés dans phpMyAdmin. [Fiche de validation SQL](preuves/sql-validation.md)
2. **Traitements serveur :** connecter les formulaires au back-end PHP, valider les données et mettre en place l'authentification et les sessions.
3. **Droits d'accès :** gérer les inscriptions et distinguer les accès aux formations gratuites et payantes selon les droits des élèves, sans multiplier artificiellement les rôles.
4. **Qualité et preuves :** documenter l'installation, vérifier les principaux scénarios par des tests et conserver des captures de l'application réellement fonctionnelle.

Les tableaux de bord complets, les cours, les replays et les fonctions avancées restent dans la feuille de route ultérieure ; ils ne sont pas annoncés comme terminés. PHP/MySQL seront intégrés progressivement selon les notions étudiées dans la formation BTS SIO SLAM suivie à distance via Studi.

## Extension cible — application mobile Flutter (élève)

Après stabilisation du socle Web PHP/MariaDB et des API, une **application mobile Flutter/Dart** complète sur le périmètre **élève** sera développée pour Android (iOS envisageable selon l'environnement disponible). Elle partagera les comptes, inscriptions, droits d'accès, cours et progressions avec le site Web, via une **API PHP sécurisée** et une base commune. Elle ne sera pas un simple site dans une WebView.

**Parcours mobile cible :** découvrir les formations → créer un compte / se connecter → consulter les inscriptions et droits → accéder aux cours autorisés → lire les leçons et ressources compatibles → marquer une leçon comme terminée → retrouver sa progression synchronisée. Les formations payantes respectent les droits d'inscription ; aucun paiement mobile intégré n'est requis pour le périmètre BTS. Les fonctions professeur/administrateur, examens, remise de devoirs, notifications et messagerie restent principalement Web ou ultérieures.

**Statut :** Le schéma MariaDB V1 est validé ; Flutter, API, authentification et progression ne sont **pas encore réalisés**. Le développement sera engagé après les cours Studi correspondants et un MVP Web opérationnel. Voir [feuille de route mobile](feuille-de-route-mobile.md). Cette extension complète la seconde réalisation E6, sans constituer une troisième réalisation indépendante.


## Extension cible — plateforme internationale (proposition à valider)

Le MVP E6 reste prioritaire et distinct de la version de production destinée à l'association. Les fonctionnalités suivantes sont prévues, non réalisées :

- Interface bilingue français/anglais, choix visible à l'accueil et modifiable dans les paramètres ; sections francophone et anglophone sur une plateforme commune.
- Objectif initial : 100 élèves, 10 professeurs, plusieurs classes par professeur (6 à 7 à titre indicatif), jusqu'à 5 cours simultanés sous réserve de tests de charge.
- Tableau de bord professeur : classes attribuées, planning, lancement des cours, ressources et replays ; élèves : accès aux seules classes autorisées ; administration : gestion des comptes, classes et inscriptions, y compris inscription manuelle des élèves payant en espèces.
- BigBlueButton auto-hébergé sur un serveur distinct, intégration via API côté serveur, cours en direct sans abonnement Zoom, enregistrements et stockage des replays maîtrisés par l'association.
- Stripe Checkout/Billing et webhooks sécurisés : carte récurrente, SEPA en EUR et Bacs en GBP selon éligibilité ; compte Stripe au nom de l'association britannique, versements sur son compte bancaire. Frais de transaction et conversion à confirmer. Aucun stockage des données de carte dans l'application.
- Infrastructure envisagée : VPS applicatif et VPS BigBlueButton OVHcloud, HTTPS, sauvegardes externes chiffrées, contrôle des accès, surveillance et tests de restauration. Dimensionnement BBB, stockage et bande passante à valider avant production ; serveur dédié si croissance importante.
- Budget cible de fonctionnement : 550 €/an (45,83 €/mois), non contractuel, hors commissions de paiement, publication sur les stores et maintenance rémunérée. Hébergement de la première année proposé gratuitement à l'association ; années suivantes à sa charge, tarifs révisables selon usage et prix fournisseurs.

Ordre de réalisation : actualiser les besoins et modèles UML/SQL ; connecter PHP à MariaDB via PDO ; inscription, authentification et droits ; tableaux de bord et parcours pédagogique ; API sécurisée et Flutter élève ; intégrations BBB et Stripe ; tests et recette avant production. Prévoir le bilinguisme et la sécurité dès la conception. Réaliser un prototype BBB et des tests de charge avant de confirmer le budget.
