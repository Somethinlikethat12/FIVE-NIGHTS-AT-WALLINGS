-- Five Nights at Wallings: Online — initial Supabase schema
-- Run this in Supabase Dashboard > SQL Editor.
-- Only public profile and save rows are exposed. Realtime presence/broadcast is used by online.html.
create table if not exists public.guard_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Guard' check (char_length(display_name) between 1 and 18),
  level integer not null default 1 check (level >= 1),
  experience integer not null default 0 check (experience >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.guard_saves (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.guard_profiles enable row level security;
alter table public.guard_saves enable row level security;
create policy "Profiles are readable by everyone" on public.guard_profiles for select using (true);
create policy "Users create their own profile" on public.guard_profiles for insert with check (auth.uid() = id);
create policy "Users update their own profile" on public.guard_profiles for update using (auth.uid() = id) with check (auth.uid() = id);
create policy "Users read their own save" on public.guard_saves for select using (auth.uid() = user_id);
create policy "Users create their own save" on public.guard_saves for insert with check (auth.uid() = user_id);
create policy "Users update their own save" on public.guard_saves for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
