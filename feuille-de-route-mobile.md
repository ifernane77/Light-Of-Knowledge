# Feuille de route — Light of Knowledge mobile (Flutter)

## Objectif E6 SLAM 2027

Développer, **après la stabilisation du socle Web**, une application mobile Flutter/Dart complète sur le **parcours élève**. Le site Web et le mobile constituent deux interfaces d'une même réalisation professionnelle, avec une API PHP et une base MySQL/MariaDB communes.

**État au 26/11/2026 :** les interfaces publiques HTML/CSS sont opérationnelles et le schéma MariaDB V1 a été validé le 24/11. Le back-end PHP, la connexion PDO, l'API et Flutter ne sont pas développés. Les tâches ci-dessous sont des objectifs, pas des réalisations acquises.

## Phases et dépendances

| Phase | Livrables | Statut | Prérequis |
|---|---|---|---|
| 1 — Socle Web | Schéma SQL, comptes, formations, inscriptions, sessions PHP, droits gratuits/payants | En cours : SQL V1 validé, PHP à faire | Leçons SQL et PHP |
| 2 — Parcours pédagogique Web | Catalogue dynamique, tableau de bord élève, cours/leçons et progression persistante | À faire | Phase 1 |
| 3 — API partagée | Endpoints JSON sécurisés : connexion, formations, inscriptions, leçons, progression ; tests des droits | À faire | Phases 1–2, cours API |
| 4 — Client Flutter | Navigation, connexion, catalogue, mes formations, cours/leçons, progression, états d'erreur | À faire | Phase 3 et cours Dart/Flutter |
| 5 — Validation E6 | Tests croisés Web/mobile, tests d'accès, installation, captures, documentation, correction/évolution tracée dans Git | À faire | Phases 1–4 |

Aucune date arbitraire n'est fixée : renseigner les dates prévues **avant** de commencer chaque tâche, conformément au suivi du projet.

## Parcours de démonstration cible

1. L'administrateur crée une formation et une leçon sur le Web (données fictives).
2. L'élève fictif se connecte sur mobile et retrouve ses inscriptions.
3. Il consulte une leçon autorisée et la marque comme terminée.
4. Il se connecte sur le Web et retrouve sa progression.
5. Une tentative d'accès à un cours non autorisé est refusée côté API.

## Limites raisonnables du périmètre mobile

- **Inclus :** parcours élève complet, ressources simples, progression synchronisée, contrôles d'accès et tests.
- **Non requis dans le mobile BTS :** administration, espace professeur, paiement intégré, examens complexes, messagerie, notifications push, stockage vidéo et accès hors ligne.
- **À confirmer :** déploiement distant sécurisé, choix du mécanisme d'authentification mobile et compatibilité Android selon le matériel de test.

## Preuves à constituer au fil du développement

- Code source Web, API et Flutter versionné ; commits identifiables.
- MCD/MLD et script SQL cohérents avec la base effective.
- Contrats d'API documentés (routes, paramètres, réponses et erreurs).
- Jeux de données fictives et procédure d'installation/reproduction.
- Cahier de tests avec résultats, captures Web/mobile et tests de sécurité des droits.
- Exemple de maintenance corrective ou évolutive avec modification, tests et documentation mise à jour.

## Règle pédagogique

Ne pas implémenter une notion avant de l'avoir étudiée dans Studi. Priorité au fonctionnement de la plateforme Web et de l'API avant le développement mobile. Adapter le périmètre si le calendrier avant l'E6 2027 l'exige, sans annoncer de fonctionnalités non réalisées.


L'extension internationale (FR/EN, BBB, Stripe) est décrite dans le [cahier des charges](cahier-des-charges.md) et ne constitue pas une obligation du MVP mobile E6. Prévoir l'internationalisation dès la conception des interfaces.
