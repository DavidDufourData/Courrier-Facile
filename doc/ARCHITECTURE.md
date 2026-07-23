# Architecture

- Frontend : Next.js App Router + TypeScript
- UI : CSS natif dans le starter, migration possible vers Tailwind
- Auth/DB/Storage : Supabase
- Paiement : Stripe Checkout + Customer Portal
- IA : appel serveur uniquement, jamais depuis le navigateur
- Déploiement : Vercel

## Flux d'analyse
1. Upload vers un bucket privé Supabase.
2. Création d'une ligne `documents` au statut `uploaded`.
3. Fonction serveur : extraction du texte, analyse IA, validation JSON avec Zod.
4. Sauvegarde du résultat et génération des tâches.
5. Affichage après contrôle par l'utilisateur.

## Sécurité minimale
- RLS sur toutes les tables.
- Bucket privé et URLs signées.
- Clés secrètes exclusivement côté serveur.
- Suppression configurable des documents sources.
- Journaux sans contenu intégral des courriers.
