# Optima Sanitas — public site

Static website for **Optima Sanitas** on [Solana Mobile Seeker](https://solanamobile.com/seeker): a landing page, a legal index, and **per-app** privacy, terms, license, and copyright HTML.

| Folder | App |
|--------|-----|
| **`sanitas-seeker/`** | **Sanitas Seeker** — workout and wellness companion for Seeker |
| **`calc/`** | **Seeker Mobile Calc** — scientific calculator and Solana wallet tools for Seeker |

Shared layout and branding: **`assets/site-theme.css`**, **`assets/brand-icon.png`**. Use bundled assets rather than fragile hotlinks (e.g. third-party image hosts).

**Where it’s served**

- **`https://optimasanitas.sol.site`** — SNS **`optimasanitas.sol`** + Sol.site ([configuration](https://docs.sns.id/collection/sns-v2/sol.site/website-configuration.md))
- **`https://optimasanitas.github.io/optimasanitas-site/`** — GitHub Pages mirror

**Firebase Hosting:** deploy from this repo — default URL `https://<PROJECT_ID>.web.app` (and `firebaseapp.com`). Useful stable HTTPS; you can point SNS **URL** records at Firebase or a custom domain.

**SNS / Sol.site:** Use **URL** + **IPFS** records on [sns.id](https://www.sns.id/) — see below. `*.sol.site` may show the SNS profile until Sol.site is wired to your host; Brave [URL/CNAME resolution](https://docs.sns.id/collection/sns-v1/records#url-cname-records) and IPFS gateways still reach your content.

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

## GitHub Pages

1. Push this tree to branch **`main`** on [OptimaSanitas/optimasanitas-site](https://github.com/OptimaSanitas/optimasanitas-site).
2. **Settings → Pages:** Deploy from branch **`main`**, folder **`/ (root)`**.
3. **Custom domain:** add **`optimasanitas.sol.site`**, wait for DNS check, **Enforce HTTPS**. Only **one** GitHub Pages site should own that hostname.
4. **sns.id** → **`optimasanitas.sol`** → **Configure Sol.site** → CNAME **`optimasanitas.github.io`** ([SNS website configuration](https://docs.sns.id/collection/sns-v2/sol.site/website-configuration.md)).

**Repo `CNAME`:** file contains `optimasanitas.sol.site` for Pages.

Confirm in a browser: hub at `https://optimasanitas.sol.site/` and legal paths such as `…/sanitas-seeker/privacy.html` and `…/calc/privacy.html` return **200**.

---

## Layout

| Path | Role |
|------|------|
| **`index.html`** | Brand hub for Optima Sanitas apps on Seeker |
| **`legal.html`** | Index of legal documents |
| **`sanitas-seeker/*.html`** | Legal pages for **Sanitas Seeker** |
| **`calc/*.html`** | Legal pages for **Seeker Mobile Calc** |
| *(future)* **`…/`** | Additional per-app folders as new titles ship |

For store and in-app links, prefer a **stable HTTPS origin** you control (Firebase **`https://<PROJECT_ID>.web.app`**, the GitHub Pages mirror above, or a pinned IPFS gateway URL like `https://ipfs.io/ipfs/<CID>`). Verify resolver behavior for **`optimasanitas.sol.site`** after DNS changes.

*Templates: review with counsel before production or store release.*
