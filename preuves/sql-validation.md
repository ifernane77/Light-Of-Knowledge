# Validation manuelle MariaDB V1

| Test | Résultat observé | Statut | Trace |
| --- | --- | --- | --- |
| 1. Tables | Cinq tables V1 | Validé | Séance et [capture de la structure](sql/01-structure.png) |
| 2. Formations | Trois offres actives à 0 €, 300 € et 350 € | Validé | Séance dans phpMyAdmin |
| 3. Rôles | `administrateur`, `eleve`, `professeur` | Validé | Séance dans phpMyAdmin |
| 4. Comptes et rôles | Lina a deux rôles, Nora et Samia ont le rôle `eleve` | Validé | Séance dans phpMyAdmin |
| 5. Inscriptions | Nora en attente en option 1. Samia annulée en option 1 et validée en option 2. | Validé | Séance dans phpMyAdmin |
| 6. Comptage | Cours gratuit 0, option 1 = 2, option 2 = 1 | Validé | Séance dans phpMyAdmin |
| 7. Clés étrangères | Quatre clés étrangères | Validé | Séance dans phpMyAdmin |
| 8. Compteurs | 3 comptes, 3 rôles, 4 attributions, 3 formations, 3 inscriptions | Validé | Requête corrigée exécutée en séance. [Capture des effectifs après import](sql/02-donnees-fictives.sql.png) |
| Réimportation des scripts 01 et 02 | Mêmes compteurs, aucun doublon | Validé | Comparaison en séance dans phpMyAdmin |
| 9b. Code de rôle en double | Erreur `#1062` constatée dans phpMyAdmin | Validé | Capture disponible dans la conversation avec le tuteur |
| 9g. Clé étrangère avec `utilisateur_id = 0` | Erreur `#1452` | Validé | Confirmation de l'étudiant, sans capture conservée |
| 9a, 9c à 9f, 9h à 9j | — | Non exécutés | — |

Les captures `preuves/sql-01-structure.png` et `preuves/sql-02-tests.png` restent à enregistrer sous ces noms. La première montrera les cinq tables et la seconde les résultats des requêtes SQL.
