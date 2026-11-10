# Five Nights: Online — setup

The original single-player game remains available from `index.html`. The new `online.html` page is the first multiplayer milestone: a shared pizzeria lobby, live player presence, guard radio, room movement, role changes, and a cooperative night-shift simulation.

## Connect the public world

1. Create a free project at [Supabase](https://supabase.com/).
2. In the Supabase project dashboard, open **Project Settings → API**.
3. Copy the **Project URL** and the **publishable/anon public key**.
4. Open the game's **Online multiplayer** menu entry (or `online.html` directly).
5. Enter a guard name, paste the URL and public key, then select **Connect to public world**.
6. Share the same GitHub Pages link with friends. Players using the same Supabase project join the same public pizzeria channel.

No local server or local computer setup is needed. The page is static and runs in the browser.

## What works in this first milestone

- Live room presence across browsers and devices.
- Shared player list and guard radio.
- Room movement with WASD or by clicking a room.
- Camera Operator, Maintenance, and Shift Lead roles.
- A shared night-shift simulation with power drain, door controls, roaming threat, and team survival/failure.

## Current limitations

This is an **MMO foundation/prototype**, not a finished persistent MMO yet. The live session uses Supabase Realtime presence and broadcasts. The shift simulation is currently led by the player who starts it; if that player disconnects, the shift can stop updating. Accounts, durable character progression, a server-authoritative enemy simulation, matchmaking, moderation, and production anti-cheat are future work.

The SQL file `supabase-schema.sql` is groundwork for account profiles and saved progression. The current page does not yet read or write those tables.

## Security

- Only put the Supabase **public publishable/anon key** in the page. Never put a service-role key, database password, or other secret in client-side code.
- The initial channel is intentionally public to anyone who has the same project URL/key. Do not treat it as a private server.
- Before a public release, add authenticated accounts, server-side validation, chat moderation/rate limits, and stricter Realtime policies.
