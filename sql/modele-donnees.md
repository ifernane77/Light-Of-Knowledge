# Modèle de données MariaDB V1

| Table | Contenu et clés |
| --- | --- |
| `utilisateurs` | Un compte par e-mail. L'identifiant est la clé primaire. Le téléphone est facultatif. Seul le hash est conservé, dans une colonne de 255 caractères. La confirmation sert uniquement à vérifier le formulaire. |
| `roles` | Un identifiant et un code unique pour chacun des rôles `administrateur`, `professeur` et `eleve`. Une contrainte `CHECK` limite les codes à ces trois valeurs exactes. |
| `utilisateur_roles` | Relie un compte et un rôle grâce à deux clés étrangères. Les deux identifiants forment la clé primaire, ce qui permet plusieurs rôles par compte et interdit de répéter le même couple. |
| `formations` | Un identifiant et un code stable et unique, repris du formulaire HTML. `DECIMAL` conserve le prix exact en euros avec deux décimales. `actif` vaut 1 pour une offre active ou 0 pour une offre inactive. |
| `inscriptions` | Relie un compte et une formation. Chaque ligne a un identifiant, une date et un statut. La contrainte `UNIQUE` sur le couple compte/formation limite ce couple à une inscription. |

Une clé primaire identifie une ligne. Une clé étrangère impose que la ligne liée existe. Les relations utilisent des identifiants, même quand un e-mail ou un titre change. InnoDB applique les clés étrangères et UTF8MB4 conserve les accents et les caractères Unicode.

Le statut est un `ENUM`, une liste de valeurs autorisées. Une demande démarre par défaut à `en_attente`, puis la future application pourra la passer à `validee` ou `annulee`. Si un élève redemande la même offre, la V1 prévoit de reprendre la ligne existante. La base conserve le statut courant. Le futur PHP vérifiera également que le compte concerné a le rôle `eleve`.

## Accès aux formations

- Le cours « Développer un caractère islamique » est accessible directement, sans inscription payante.
- L'option 1 validée donne accès à son programme et au cours gratuit.
- L'option 2 validée donne accès au programme complet de l'option 1, à son complément et au cours gratuit. Une seule inscription à l'option 2 suffit pour ce scénario.
- Une inscription payante en attente ou annulée ne donne aucun droit payant. Si un élève possède une autre inscription validée, les droits de celle-ci restent applicables.

PHP contrôlera ces droits côté serveur avant de servir les pages ou ressources protégées. La base stocke les éléments sur lesquels PHP s'appuiera pour prendre cette décision.

## Extensions Web et Flutter

Une future table `cours` pourra être reliée aux formations par une table d'association. Cela permettra aux deux offres de partager un même cours. Chaque leçon pourra référencer son cours et chaque ressource pédagogique sa leçon. Une table `progressions` pourra référencer l'utilisateur et la leçon et enregistrer son état d'avancement. Le Web et Flutter utiliseront les mêmes données MariaDB via une API PHP sécurisée qui appliquera les mêmes règles d'accès.

## Données fictives et réimportation

Le jeu de démonstration utilise uniquement des comptes en `example.test` et des hashes bcrypt générés par `password_hash()` à partir de mots de passe aléatoires. Les comptes servent aux tests SQL locaux. Les insertions recherchent les lignes par e-mail ou code et ajoutent uniquement les lignes manquantes. Une valeur déjà enregistrée est conservée, y compris le tarif et le statut. Le test 8 compare les compteurs après deux imports successifs.
