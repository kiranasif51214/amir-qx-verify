# Auto-Verification Helper — Railway guide

This is the piece that checks trader IDs automatically: it messages the
affiliate bot with each trader ID, reads the reply, and tells your app
whether the trader is real. Your bot then approves or declines on its own.

## 1. Deploy on Railway

1. Upload this folder to a GitHub repo (or drag-and-drop the files).
2. Railway → **New Project → Deploy from GitHub repo** and pick this repo.
   Railway sees `railway.json` and starts it as an always-on worker.

## 2. Set the variables

Railway → your service → **Variables**:

| Variable | Value |
| --- | --- |
| `VERIFIER_SECRET` | The same secret you saved in the Lovable app (the one you entered when the app asked for it) |
| `APP_BASE` | Only needed if you move the app to Railway: set it to your Railway app's URL (it already defaults to the app's current address) |

## 3. First login (one time only)

1. When the helper starts, Telegram sends a login code to your phone.
2. Open your app's admin page and type that code in the Telegram settings
   area.
3. The helper logs in and saves the session — it stays logged in forever.
   Railway restarts it automatically if it ever stops.

## 4. Done

Send a trader ID to your bot. The bot saves the request, the helper checks
it with the affiliate bot, and the bot replies with the result by itself.

## Files

- `bridge.py` — the helper itself
- `requirements.txt` — the two Python packages it needs
- `railway.json` — tells Railway how to run it
- `Procfile` / `start.sh` — alternative start commands (Railway uses `railway.json`)
- `.python-version` — pins Python 3.11
