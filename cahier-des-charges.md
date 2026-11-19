# Cahier des charges — Light of Knowledge

## Présentation du projet

Light of Knowledge est une plateforme web destinée à Light of Knowledge Institute France.

Le projet est développé progressivement dans le cadre de ma formation en BTS SIO option SLAM. Les fonctionnalités sont ajoutées uniquement lorsque les notions nécessaires ont été étudiées.

## Objectifs principaux

La plateforme doit permettre à terme de :

* présenter l'institut et ses formations ;
* permettre aux utilisateurs de créer un compte et de se connecter ;
* gérer les rôles et les droits d'accès ;
* gérer les inscriptions aux formations ;
* proposer des espaces adaptés aux administrateurs, professeurs et élèves ;
* permettre l'accès aux ressources pédagogiques selon les inscriptions ;
* intégrer progressivement le suivi pédagogique, les examens et la communication interne.

## Formations et règles d'accès

### Les Essentiels de l'Islam — Option 1

* tarif : 300 € ;
* programme essentiel ;
* donne également accès au cours « Développer un caractère islamique ».

### Les Essentiels de l'Islam — Option 2

* tarif : 350 € ;
* comprend l'intégralité du programme de l'option 1 ;
* ajoute un enseignement sur les règles du Nikāḥ et du Ṭalāq ;
* donne également accès au cours « Développer un caractère islamique ».

### Développer un caractère islamique

* cours gratuit ;
* accessible directement ;
* inclus également pour les élèves inscrits aux options 1 et 2.

## Gestion des utilisateurs et des droits

L'application Light of Knowledge prévoit trois rôles principaux.

### Administrateur

L'administrateur dispose des droits les plus élevés.

Il pourra notamment :

* gérer les utilisateurs ;
* gérer les professeurs ;
* gérer les élèves ;
* gérer les cursus et les cours ;
* gérer les inscriptions ;
* accéder aux fonctions d'administration de la plateforme.

Un administrateur pourra également posséder le rôle de professeur.

### Professeur

Le professeur pourra notamment :

* accéder à son tableau de bord ;
* consulter les cours dont il est responsable ;
* gérer les ressources associées à ses cours ;
* consulter les élèves inscrits à ses cours.

Les fonctions de correction, de suivi pédagogique et de gestion des examens seront ajoutées dans les versions ultérieures.

### Élève

L'élève pourra notamment :

* accéder à son tableau de bord ;
* consulter les cursus auxquels il est inscrit ;
* accéder aux cours et aux ressources autorisées ;
* consulter ultérieurement ses résultats et son suivi pédagogique.

Le rôle `eleve` reste unique dans l'application.

La distinction entre un élève gratuit et un élève payant sera effectuée par ses inscriptions et ses droits d'accès aux formations, et non par la création de rôles supplémentaires.

## Interfaces prévues

Quatre interfaces principales sont envisagées :

* un tableau de bord administrateur ;
* un tableau de bord professeur ;
* un espace élève gratuit ;
* un espace élève payant.

Les deux espaces élèves correspondent à des niveaux d'accès différents selon les formations auxquelles l'élève est inscrit.

## Principe de sécurité

Chaque utilisateur doit uniquement pouvoir accéder aux fonctionnalités correspondant à son rôle et à ses droits d'inscription.

Les contrôles d'accès devront être réalisés côté serveur afin qu'un utilisateur ne puisse pas accéder à une page protégée simplement en saisissant son adresse dans le navigateur.

## État actuel

La première interface publique est réalisée en HTML et CSS avec :

* une page d'accueil ;
* une page formations ;
* une page d'inscription ;
* une page de connexion ;
* une navigation commune ;
* une mise en page responsive ;
* une identité graphique cohérente ;
* les premières règles métier visibles sur les formations et les tarifs.

Le traitement PHP des formulaires, la base de données, l'authentification et les tableaux de bord restent à développer.

## Conventions de développement

Afin de garder un projet cohérent et lisible, les règles suivantes sont utilisées :

- les noms de fichiers sont écrits en minuscules ;
- les mots dans les noms de fichiers sont séparés par des tirets si nécessaire ;
- les noms de variables PHP sont explicites ;
- les constantes sont écrites en majuscules ;
- les noms des rôles restent identiques dans toute l'application.

Rôles retenus :

- administrateur ;
- professeur ;
- eleve.

Exemples :

- `liste-cours.php`
- `profil-eleve.php`
- `$projectName`
- `ROLE_ADMIN`

## Extension applicative — application mobile Light of Knowledge (V mobile élève)

### Objectif et périmètre

Une application **Flutter/Dart native multiplateforme** est prévue pour les élèves, en complément de la plateforme Web. Elle doit offrir un parcours élève réellement utilisable, avec des données synchronisées, et non une simple copie statique des pages HTML. Android sera la cible prioritaire ; iOS reste conditionné aux outils et aux possibilités de test.

### Fonctionnalités mobiles attendues

1. Catalogue des formations : titres, descriptions, tarifs existants (300 €, 350 € et cours gratuit), détails et conditions d'accès.
2. Inscription à un compte et connexion sécurisée ; déconnexion et gestion des erreurs courantes.
3. Tableau de bord de l'élève avec ses formations et ses inscriptions.
4. Accès aux cours et leçons uniquement selon les droits : option 1, option 2, cours gratuit, sans ajouter de rôle « élève payant ».
5. Consultation de ressources pédagogiques compatibles (texte, documents et liens vers les replays/cours) ; pas d'hébergement vidéo complexe imposé.
6. Suivi de progression : leçons terminées et progression par formation, enregistrées côté serveur et retrouvées sur le Web et le mobile.
7. Gestion des états usuels : chargement, absence de données, erreurs réseau, accès refusé et session expirée.

### Rôles et interfaces

L'application mobile est **centrée sur le rôle `eleve`**. Les tableaux de bord professeur et administrateur demeurent sur le Web ; il n'est pas nécessaire de les reproduire dans Flutter pour que le parcours élève soit complet. Un administrateur peut également être professeur, conformément aux règles existantes.

### Architecture et sécurité

- Client Flutter → **API PHP sécurisée** (échanges JSON via HTTPS en environnement distant) → services métier PHP → MySQL/MariaDB.
- **Une base de données commune** et des droits d'accès vérifiés côté serveur, indépendamment des écrans mobiles.
- Authentification adaptée à un client mobile, mots de passe hachés, validation des entrées, accès limité aux ressources autorisées ; aucun identifiant de base de données dans l'application Flutter.
- Prévoir des tests de synchronisation Web/mobile, de refus d'accès aux cours non autorisés, de gestion des erreurs et de progression.
- Utiliser uniquement des données de démonstration ou des contenus dont l'utilisation est autorisée.

### Critères de réception de l'extension mobile

Un compte élève fictif peut se connecter depuis le mobile, retrouver ses inscriptions, consulter une leçon autorisée, enregistrer sa progression, puis constater la même progression depuis le Web. Un élève non inscrit ne peut pas accéder à une formation protégée, même en modifiant une requête.

### Ordre et état de réalisation

**À développer, non réalisé :** d'abord base et parcours Web PHP, ensuite API et tests, puis Flutter après les leçons Dart/Flutter du programme Studi, enfin tests croisés et documentation. Les fonctionnalités V3/V4 du site (examens, travaux, communication, automatisations) ne sont pas rendues obligatoires dans la version mobile BTS. Voir `feuille-de-route-mobile.md`.
