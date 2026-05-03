# Optima Sanitas — public site (org-wide)

This repository is the **canonical public web root** for the **Optima Sanitas** brand on Seeker: landing **`index.html`**, **`legal.html`** (hub linking both apps’ legal sets), room for more apps over time, and **per-app legal HTML** in folders (**`sanitas-seeker/`**, **`calc/`**). Shared chrome lives in **`assets/site-theme.css`** with the logo at **`assets/brand-icon.png`** (do not hotlink external image hosts; Imgur links rot).

It replaces using **`seeker-mobile-calc-legal`** as the main site repo — that name stays attached to the calculator only; this repo is the line hub.

**Agent / thread handoff:** This repo is **public** on GitHub — long continuation / agent handoffs **cannot** be included here; they **may** live only in **private** repos (**`OptimaSanitas/SeekerMobileCalc`**, **`OptimaSanitas/lev-app`**, etc.). The **`CONTINUATION.md`** here is a **short stub** only (see that file’s header). Same rule as **`gameseekrs-max/VaultRunner`** `docs/continuation.md` **§ *Continuation files — private repos only*** for the GameSeekrs line.

**Org GitHub visibility:** Under **`OptimaSanitas`**, only **`optimasanitas-site`** (this repo) and **`lev-anchor`** are **public** repositories. **App and legacy sources** — **`SeekerMobileCalc`**, **`lev-app`**, **`seeker-mobile-calc-legal`**, **`solana-seeker-exercise-app`**, and similar — stay **private**; ship store-facing legal HTML from this Pages repo, not from private repo blobs. **Before** changing any repo’s visibility, confirm with **`SeekerMobileCalc`** `CONTINUATION.md` (org policy). **Related org `gameseekrs-max`:** only **`gameseekrs-site`** + **`Gameseekrs`** are public; **`VaultRunner`** / **`GSkrsFlashlight`** stay private — see **`gameseekrs-max/VaultRunner`** `docs/continuation.md`.

**Not the GameSeekrs line:** This site serves **Optima Sanitas** apps (**`optimasanitas.sol`** → **`optimasanitas.sol.site`**). **GameSeekrs** is a **separate** org and SNS (**`gameseekrs.sol`** / **`gameseekrs.sol.site`**, games + utilities). Do **not** swap legal URLs, store copy, or hub styling between the two. Maintainers cloning **`gameseekrs-max/Gameseekrs`** should set **`origin`** to **SSH** (`git@github.com:gameseekrs-max/Gameseekrs.git`) so non-interactive pushes work — see VaultRunner **`docs/continuation.md`** (*2026-05-03 — Other workspaces vs GameSeekrs + `Gameseekrs` git remote*).

**GitHub Pages (HTTPS mirror):** `https://optimasanitas.github.io/optimasanitas-site/`  
**Firebase Hosting:** deploy from this repo — default URL `https://<PROJECT_ID>.web.app` (and `firebaseapp.com`). Good stable HTTPS if IPFS pinning signups are painful; point SNS **URL** record at your Firebase URL or custom domain.  
**SNS / Sol.site:** Use **URL** + **IPFS** records on [sns.id](https://www.sns.id/) — see below. `*.sol.site` may keep showing the SNS profile unless Bonfida wires IPFS into that gateway; Brave [URL/CNAME resolution](https://docs.sns.id/collection/sns-v1/records#url-cname-records) and IPFS gateways still reach your content.

---

## Firebase Hosting

Config lives in **`firebase.json`** (deploys **`index.html`**, **`legal.html`**, **`assets/site-theme.css`**, **`calc/*.html`**, **`sanitas-seeker/*.html`** — ignores `.git`, **`scripts/`**, markdown, GitHub **`CNAME`**).

1. Install CLI: `npm install -g firebase-tools`
2. Log in: `firebase login`
3. Link project (creates **`.firebaserc`**): from this folder run **`firebase use --add`** and pick your Firebase project (create one in the [Firebase console](https://console.firebase.google.com/) first if needed).
4. Deploy: **`firebase deploy --only hosting`**
5. Open **`https://<PROJECT_ID>.web.app`**, **`…/sanitas-seeker/privacy.html`**, and **`…/calc/privacy.html`**.

Optional: **Hosting → Add custom domain** in Firebase console (DNS at your registrar). For SNS without a registrar, keep using the **`*.web.app`** URL in the **URL** record.

---

## IPFS for `optimasanitas.sol` (sns.id → Other records)

### Local Kubo (this repo)

1. **Install Kubo + init repo** (Linux `x86_64` / `aarch64`; installs `~/.local/bin/ipfs`, init `~/.ipfs`):

   ```bash
   chmod +x scripts/ipfs-install-kubo.sh scripts/ipfs-stage-and-add.sh
   ./scripts/ipfs-install-kubo.sh
   ```

2. **Add and pin the staged site** (prints root CID and `ipfs://…` for sns.id):

   ```bash
   ./scripts/ipfs-stage-and-add.sh
   ```

3. **Optional — serve the network** so gateways can find blocks while this machine is online (opens swarm ports; check firewall):

   ```bash
   ipfs daemon
   ```

   For always-on publishing, run the daemon under **systemd --user**, or use a **remote pin** below so you do not depend on your laptop.

### Manual staging (same layout)

1. **Build a clean folder** of exactly what you serve (no `.git`):

   ```bash
   STAGE=/tmp/optimasanitas-ipfs-stage
   rm -rf "$STAGE" && mkdir -p "$STAGE/calc" "$STAGE/sanitas-seeker"
   cp index.html "$STAGE/"
   cp calc/*.html "$STAGE/calc/"
   cp sanitas-seeker/*.html "$STAGE/sanitas-seeker/"
   ```

2. **Produce a directory CID** with Kubo:

   ```bash
   ipfs add -r -Q --cid-version=1 "$STAGE"
   ipfs pin add <CID>
   ```

   After adding **`sanitas-seeker/`**, **regenerate** the CID with the commands above (do not rely on an old example hash).

3. **Pin the CID** on a public pin layer so gateways can load it when your node is off (pick one): [Pinata](https://pinata.cloud/), [Filebase](https://filebase.com/), [Storacha](https://web3.storage/pricing/), or keep **`ipfs daemon`** running on a reachable node.

4. **sns.id** → domain → **Other records** → **IPFS:** enter **`ipfs://bafybei…`** (same CID as above, with the `ipfs://` prefix per the form).

5. **Optional:** set a **URL** record to `https://optimasanitas.github.io/optimasanitas-site/` for resolvers that prefer HTTPS ([records doc](https://docs.sns.id/collection/sns-v1/records#url-cname-records)).

6. **Smoke test:** open `https://ipfs.io/ipfs/<CID>/`, `…/sanitas-seeker/privacy.html`, and `…/calc/privacy.html` after pinning.

**Note:** SNS **CNAME** to `*.github.io` requires DNS proof on a zone **you** control; use **URL** for GitHub instead. IPFS does not replace pinning — unpinned CIDs are effectively unavailable.

---

## Create the GitHub repo and go live

1. On GitHub, create a **public** repository **`OptimaSanitas/optimasanitas-site`** (empty, no README if you will push this tree).
2. From this folder on your machine:

   ```bash
   cd /path/to/optimasanitas-site
   git init
   git add -A
   git commit -m "Initial public Optima Sanitas site + calc legal"
   git branch -M main
   git remote add origin https://github.com/OptimaSanitas/optimasanitas-site.git
   git push -u origin main
   ```

3. **Settings → Pages:** Deploy from branch **`main`**, folder **`/ (root)`**.
4. **Move the custom domain** (one site per hostname):
   - In **`seeker-mobile-calc-legal`** → **Settings → Pages → Custom domain:** **remove** `optimasanitas.sol.site` (save).
   - In **`optimasanitas-site`** → **Settings → Pages → Custom domain:** add **`optimasanitas.sol.site`**, wait for DNS check, **Enforce HTTPS**.
5. **sns.id** → **`optimasanitas.sol`** → **Configure Sol.site** → CNAME **`optimasanitas.github.io`** ([SNS website configuration](https://docs.sns.id/collection/sns-v2/sol.site/website-configuration.md)). If `optimasanitas.sol.site` still shows the SNS profile, Sol.site is not wired to GitHub yet.

6. Confirm in a browser:
   - Title **Optima Sanitas** at `https://optimasanitas.sol.site/`
   - `https://optimasanitas.sol.site/sanitas-seeker/privacy.html` and `…/calc/privacy.html` (and related legal paths) return **200**

7. **Then** ship **SeekerMobileCalc** (and any other clients) that use **`/calc/...`** legal URLs — see `src/config/legal.ts`. Until step 4–6 are done, those URLs 404 on `optimasanitas.sol.site`.

**Repo `CNAME`:** file contains `optimasanitas.sol.site` for Pages.

---

## Layout

| Path | Role |
|------|------|
| **`index.html`** | Brand hub for all Optima Sanitas apps |
| **`sanitas-seeker/*.html`** | Store / in-app legal for **Sanitas Seeker** |
| **`calc/*.html`** | Store / in-app legal for **Seeker Mobile Calc** |
| *(future)* **`…/`** | Add folders for additional apps as you ship them |

For store / in-app legal URLs today, prefer a **stable HTTPS origin** you control (**Firebase** `https://<PROJECT_ID>.web.app`, **`https://optimasanitas.github.io/optimasanitas-site`**, or a pinned IPFS gateway URL like `https://ipfs.io/ipfs/<CID>`). **`optimasanitas.sol.site`** is fine as branding only if Sol.site still serves the profile UI after you set IPFS — confirm behavior before wiring **`OPTIMA_PUBLIC_SITE`** (see **SeekerMobileCalc** `src/config/legal.ts`).

---

## Legacy repo

**`seeker-mobile-calc-legal`** — keep for history or strip to a README pointer; do **not** attach **`optimasanitas.sol.site`** to both repos.

**`solana-seeker-exercise-app`** — app/exercise naming; not ideal as the org-wide document root. Prefer **this** repo for the hub.

*Templates: review with counsel before production or store release.*
