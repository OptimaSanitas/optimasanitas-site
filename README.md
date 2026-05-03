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

Hosting is **Git only**: push to **`main`**, enable **GitHub Pages** from the repo root, point Sol.site at **`optimasanitas.github.io`**. No Firebase or IPFS in the current workflow.

---

## GitHub Pages + Sol.site

1. Push this tree to branch **`main`** on [OptimaSanitas/optimasanitas-site](https://github.com/OptimaSanitas/optimasanitas-site).
2. **Settings → Pages:** Deploy from branch **`main`**, folder **`/ (root)`**.
3. **Custom domain:** add **`optimasanitas.sol.site`**, wait for DNS check, **Enforce HTTPS**. Only **one** GitHub Pages site should own that hostname.
4. **sns.id** → **`optimasanitas.sol`** → **Configure Sol.site** → CNAME **`optimasanitas.github.io`** ([SNS website configuration](https://docs.sns.id/collection/sns-v2/sol.site/website-configuration.md)).

**Repo `CNAME`:** file contains `optimasanitas.sol.site` for Pages.

If **`optimasanitas.sol.site`** still shows the SNS profile UI, Sol.site is not wired to GitHub yet — complete step 4, then re-check GitHub’s custom-domain DNS status.

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

For store and in-app links, use **`https://optimasanitas.sol.site`** (or the **`optimasanitas.github.io/optimasanitas-site/`** mirror while DNS is in progress).

*Templates: review with counsel before production or store release.*
