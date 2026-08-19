## Gestion des utilisateurs et des droits

L'application Light of Knowledge prévoit trois rôles principaux.

### Administrateur

L'administrateur dispose des droits les plus élevés.

Il pourra notamment :

* gérer les utilisateurs ;
* gérer les professeurs ;
* gérer les élèves ;
* gérer les cursus et les cours ;
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

### Principe de sécurité

Chaque utilisateur doit uniquement pouvoir accéder aux fonctionnalités correspondant à son rôle.

Les contrôles d'accès devront être réalisés côté serveur afin qu'un utilisateur ne puisse pas accéder à une page protégée simplement en saisissant son adresse dans le navigateur.

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