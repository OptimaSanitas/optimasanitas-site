# optimasanitas-site — continuation handoff

**Public org-wide site** for **Optima Sanitas** on Seeker: **`index.html`** hub, **`calc/`** HTML legal for **Seeker Mobile Calc**, room for more app folders later. **Not** a React Native app.

## SNS / Sol.site — `optimasanitas.sol`

- **Canonical HTTPS:** **`https://optimasanitas.sol.site`** (apps + MWA `identity.uri` use this origin).
- **GitHub Pages:** branch **`main`**, **`/(root)`**; **Custom domain** `optimasanitas.sol.site` on **this** repo (remove it from **`seeker-mobile-calc-legal`** if migrating).
- **sns.id → Configure Sol.site:** CNAME **`optimasanitas.github.io`** per [SNS website configuration](https://docs.sns.id/collection/sns-v2/sol.site/website-configuration.md). **“Other records” alone** may not move traffic off the default SNS profile.

**2026-04-29 — 48-hour Sol.site lock:** After domain acquisition/transfer, **sns.id** may show **Sol.site configuration locked for 48 hours** (countdown on **Configure**). Until unlock, **`optimasanitas.sol.site`** DNS will **not** satisfy GitHub (**NotServedByPagesError**); **`Enforce HTTPS`** stays unavailable. **While locked:** test **`https://optimasanitas.github.io/optimasanitas-site/`** and **`/calc/privacy.html`**. **SeekerMobileCalc** ships **`/calc/...`** URLs on **`optimasanitas.sol.site`** — do not ship store builds that require live **`sol.site`** until DNS passes.

## Related repos

- **`OptimaSanitas/SeekerMobileCalc`** — Calc app; `src/config/legal.ts` → **`/calc/`** paths.
- **`OptimaSanitas/lev-app`** — Sanitas Seeker; `legalUrls.ts` → same **`OPTIMA_PUBLIC_SITE`**.
- **`OptimaSanitas/seeker-mobile-calc-legal`** — legacy name; org hub moved here per **`README.md`**.

## Portable snapshot

See **`~/Groking/Games/continuation.md`** for zip export rules if you add this tree to the batch.
