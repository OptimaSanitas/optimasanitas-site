# Optima Sanitas — public site (org-wide)

This repository is the **canonical public web root** for the **Optima Sanitas** brand on Seeker: landing **`index.html`**, room for more apps over time, and **per-app legal HTML** in folders (today: **`calc/`** for Seeker Mobile Calc).

It replaces using **`seeker-mobile-calc-legal`** as the main site repo — that name stays attached to the calculator only; this repo is the line hub.

**Canonical HTTPS:** `https://optimasanitas.sol.site`  
**GitHub Pages default URL:** `https://optimasanitas.github.io/optimasanitas-site/`

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
   - `https://optimasanitas.sol.site/calc/privacy.html` (and terms, license) return **200**

7. **Then** ship **SeekerMobileCalc** (and any other clients) that use **`/calc/...`** legal URLs — see `src/config/legal.ts`. Until step 4–6 are done, those URLs 404 on `optimasanitas.sol.site`.

**Repo `CNAME`:** file contains `optimasanitas.sol.site` for Pages.

---

## Layout

| Path | Role |
|------|------|
| **`index.html`** | Brand hub for all Optima Sanitas apps |
| **`calc/*.html`** | Store / in-app legal for **Seeker Mobile Calc** only |
| *(future)* **`…/`** | Add folders or pages for other apps as you ship them |

Mobile apps should keep **`OPTIMA_PUBLIC_SITE`** = `https://optimasanitas.sol.site` and use **`/calc/...`** for Calc legal URLs (see **SeekerMobileCalc** `src/config/legal.ts`).

---

## Legacy repo

**`seeker-mobile-calc-legal`** — keep for history or strip to a README pointer; do **not** attach **`optimasanitas.sol.site`** to both repos.

**`solana-seeker-exercise-app`** — app/exercise naming; not ideal as the org-wide document root. Prefer **this** repo for the hub.

*Templates: review with counsel before production or store release.*
