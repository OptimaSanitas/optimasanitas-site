# Optima Sanitas — public site

Static website for **Optima Sanitas** on [Solana Mobile Seeker](https://solanamobile.com/seeker): a landing page, a legal index, and **per-app** privacy, terms, license, and copyright HTML.

| Folder | App |
|--------|-----|
| **`sanitas-seeker/`** | **Sanitas Seeker** — workout and wellness companion for Seeker |
| **`calc/`** | **Seeker Mobile Calc** — scientific calculator and Solana wallet tools for Seeker |

Shared layout and branding: **`assets/site-theme.css`**, **`assets/brand-icon.png`**. Use bundled assets rather than fragile hotlinks (e.g. third-party image hosts).

**Where it’s served**

- **`https://optimasanitas.com`** — canonical custom domain (GitHub Pages + Namecheap)
- **`https://optimasanitas.github.io/optimasanitas-site/`** — GitHub Pages mirror
- **`https://optimasanitas.sol.site`** — optional SNS/Sol.site alias

Hosting is **Git only**: push to **`main`**, enable **GitHub Pages** from the repo root, **`CNAME`** = **`optimasanitas.com`**, **Enforce HTTPS**. No Firebase or IPFS in the current workflow.

---

## GitHub Pages + custom domain

1. Push this tree to branch **`main`** on [OptimaSanitas/optimasanitas-site](https://github.com/OptimaSanitas/optimasanitas-site).
2. **Settings → Pages:** Deploy from branch **`main`**, folder **`/ (root)`**.
3. **Custom domain:** **`optimasanitas.com`** — Namecheap **A** records (`185.199.108–111.153`) on `@`, **CNAME** `www` → **`optimasanitas.github.io`**, wait for DNS check, **Enforce HTTPS**.
4. **Optional:** SNS **`optimasanitas.sol`** / Sol.site may still point at **`optimasanitas.github.io`**; apps and store listings use **`.com`** as canonical.

**Repo `CNAME`:** `optimasanitas.com`

Confirm in a browser: `https://optimasanitas.com/`, `…/sanitas-seeker/privacy.html`, `…/calc/privacy.html` return **200**.

---

## Layout

| Path | Role |
|------|------|
| **`index.html`** | Brand hub for Optima Sanitas apps on Seeker |
| **`legal.html`** | Index of legal documents |
| **`sanitas-seeker/*.html`** | Legal pages for **Sanitas Seeker** |
| **`calc/*.html`** | Legal pages for **Seeker Mobile Calc** |
| *(future)* **`…/`** | Additional per-app folders as new titles ship |

For store and in-app links, use **`https://optimasanitas.com`** (mirror: **`optimasanitas.github.io/optimasanitas-site/`**).

*Templates: review with counsel before production or store release.*
