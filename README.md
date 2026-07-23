# Courrier Facile

Starter GitHub pour un assistant administratif IA : upload de courriers, analyse structurée, actions, échéances et réponse préparée.

## Lancer localement

```bash
cp .env.example .env.local
npm install
npm run dev
```

Puis ouvrir `http://localhost:3000`.

## Mise en place

1. Créer un projet Supabase.
2. Exécuter `supabase/migrations/001_initial.sql`.
3. Renseigner `.env.local`.
4. Connecter le dépôt à Vercel.
5. Ajouter Stripe et le fournisseur IA côté serveur.

## Important

Ce dépôt est un starter produit, pas un service juridiquement prêt à commercialiser. Les fonctions d'analyse, de paiement, de notification et d'extraction PDF sont volontairement laissées à connecter. Ne promettez ni exactitude absolue ni conseil juridique/fiscal personnalisé.

## Structure

- `app/` : pages Next.js
- `components/` : composants partagés
- `supabase/` : schéma et politiques RLS
- `ai/` : prompts structurés
- `docs/` : architecture et roadmap
