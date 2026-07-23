create extension if not exists "pgcrypto";

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  plan text not null default 'free' check (plan in ('free','premium','family')),
  created_at timestamptz not null default now()
);

create table public.documents (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  storage_path text not null,
  mime_type text,
  status text not null default 'uploaded' check (status in ('uploaded','processing','ready','error','archived')),
  organisation text,
  urgency text check (urgency in ('low','medium','high','critical')),
  deadline date,
  summary text,
  consequences text,
  reply_draft text,
  analysis jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.tasks (
  id uuid primary key default gen_random_uuid(),
  document_id uuid not null references public.documents(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  label text not null,
  completed boolean not null default false,
  due_at timestamptz,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.documents enable row level security;
alter table public.tasks enable row level security;

create policy "profiles own row" on public.profiles for all using (auth.uid()=id) with check (auth.uid()=id);
create policy "documents own rows" on public.documents for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "tasks own rows" on public.tasks for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
