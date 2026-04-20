# Whitepaper and FAQ Update: Catalog + Book Build Model

## Summary

The Vex platform has replaced its Dutch auction mechanism with a catalog-first, demand-driven model featuring open book builds. The whitepaper needs a restructured narrative to reflect this change, and the platform FAQ needs a full rewrite to replace all auction references.

## Thesis Shift

From: "We standardize private markets and run auctions."
To: "Investor demand drives what gets structured, priced, and traded."

The catalog/book build model is a stronger story. The market tells Vex what to build SPVs around, rather than Vex pre-selecting deals and running auctions. The anchor mechanism ($1M+ commitment) means real capital, not opinions, triggers deal formation. The open book build with a visible demand curve produces transparent, uniform pricing.

## Whitepaper Structure (7 pages, restructured)

### Page 1: Home (index.md, nav_order: 1)

Reframed hook. Lead with the demand-driven catalog model as the headline mechanic.

Content:
- Qualified investors browse a catalog of private companies with research summaries
- Investor demand surfaces what gets structured (not a fund manager picking deals)
- Anchor commitment ($1M+) triggers SPV formation
- Open book build with uniform clearing price (transparent, fair)
- Three regulated entities: Vex Securities (FINRA/SIPC broker-dealer, ATS), Vex Capital (exempt reporting adviser, SPV management), Vex Registry (SEC-registered transfer agent)
- Fee structure: 1% annual dilution (no carried interest, no management fee), 5% seller commission
- Secondary trading on ATS after 12-month seasoning
- Qualified Purchasers only ($5M+ individuals, $25M+ institutions)
- Risk factors paired with value propositions: illiquidity, capital loss, no guaranteed secondary market, seasoning lockup

### Page 2: The Problem (the-problem.md, nav_order: 2)

Mostly intact. The structural critique of private markets still holds (PE outperformance, illiquidity, stale pricing, long lockups, secondaries surge at $240B).

Changes:
- Sharpen the ending to set up the demand-driven solution rather than pointing toward "standardization" as an abstract concept
- Frame the secondaries surge as evidence that the market itself should determine what gets structured and at what price

### Page 3: How Vex Works (how-vex-works.md, nav_order: 3)

**New page.** Replaces both "The Vex Model" (the-vex-model.md) and "How It Works" (how-it-works.md). The centerpiece of the whitepaper.

Walks through the full lifecycle:

1. **Catalog**: Hundreds of private companies with research summaries (funding history, valuation, stage, sector). Investors browse, search, and star companies to track interest.
2. **Anchor commitment**: When an investor commits $1M+ to a company, it triggers SPV formation. Vex Capital structures a 3(c)(7) SPV with standardized documents (master PPM, series supplement, subscription agreement). Legal standardization layer explained here.
3. **Open book build**: Deal opens to all qualified investors. $10K minimum bids. Each bid specifies a maximum fully diluted valuation (FDV). Live demand curve visible to all participants (pseudonymous). Bids are binding and non-cancellable (can only increase). Valuation standardization layer explained here (100M units at FDV per company, one price, no preference stacks).
4. **Clearing**: Operator sets a cap on total raise. Uniform clearing price determined by walking the demand curve (sort bids by max FDV descending, walk cumulative USD until cap reached). All filled investors get the same price. Pro-rata allocation at the margin. Excluded bids refunded.
5. **Deployment**: Vex Capital sources equity (secondary from existing holders or primary issuance). Settlement recorded on the transfer agent registry. Three possible outcomes: full deployment, partial deployment (allocations scaled down, remainder refunded), or no deployment (all holds released, SPV wound down).
6. **Seasoning**: 12-month holding period (Rule 144, or shorter if Form 10 filed).
7. **Secondary trading**: Units become tradable on Vex's ATS via continuous limit order book. Trading standardization layer explained here.

Three standardization layers (legal, valuation, trading) are woven into the lifecycle where they naturally appear, not presented as abstract architecture. The fourth layer (governance via conditional equity) is covered in "What Comes Next" as a future capability.

New assets needed:
- Mermaid diagram: lifecycle flow (catalog > anchor > book build > clearing > deploy > season > trade)
- Demand curve concept visual

### Page 4: Why This Model (why-this-model.md, nav_order: 4)

**New page.** Replaces old "The Vex Model" (the-vex-model.md). Structural arguments for why this design produces better outcomes.

Content:
- **Demand-driven vs. fund-manager-picked**: The catalog lets the market surface what is worth structuring. The anchor mechanism means real capital triggers deal formation.
- **Transparent pricing**: Open book build with visible demand curve. Uniform clearing means no one overpays relative to others. Contrast with opaque secondaries brokers and negotiated block trades.
- **Cost structure**: 1% annual dilution fee (accrued quarterly as unit issuance, not a cash charge). 5% seller commission on transactions. No carried interest, no management fee. Compare to the 2/20 industry standard.
- **Regulated infrastructure, not a fund**: Three entities with distinct regulatory roles. This is plumbing, not a fund with a thesis.
- **Risk factors**: No guarantee of secondary liquidity. 12-month seasoning lockup. Capital at risk. SPV may partially deploy or refund entirely. Catalog research is informational, not a recommendation.

Every strength paired with its corresponding risk per FINRA 2210 fair balance requirements.

### Page 5: What Comes Next (what-comes-next.md, nav_order: 5)

Two future capabilities, both clearly framed as roadmap (not live features):

- **Conditional equity (governance)**: Competing unit classes that encode market probability around governance outcomes. Management gets dollar-weighted signal on decision value. Enabled by the standardized SPV and trading infrastructure. No timeline promises.
- **Tokenization**: Same units, same legal structure, same compliance. On-chain representation as a distribution upgrade. Enables AMM liquidity pools, lending collateral, composability, cross-chain settlement. Reference the $33B tokenized RWA market. Infrastructure readiness framing, not a crypto pivot.

### Page 6: Why Now (why-now.md, nav_order: 6)

Mostly intact. Three converging forces: liquidity crisis (secondaries data), regulatory window (SEC custody modernization, GENIUS Act), technology readiness.

Changes:
- Update any references to auction mechanics
- Add that the catalog/book build model scales with demand rather than requiring Vex to pre-commit to deals, making it suited to capture this window

### Page 7: Get Started (get-started.md, nav_order: 7)

Updated calls to action.

Changes:
- Summit referenced as past event ("launched at our inaugural Private Markets Summit in April 2026")
- Point forward to current entry point
- QP thresholds ($5M+ individuals, $25M+ institutions) retained
- Separate CTAs for allocators and companies/shareholders

### Pages to delete

- `the-vex-model.md`: Content split between "How Vex Works" and "Why This Model"
- `governance.md`: Content folded into "What Comes Next"

## Platform FAQ Rewrite (potential-garbanzo)

10 sections derived from the whitepaper structure. Replaces all Dutch auction references. Serves as the operational detail layer that complements the whitepaper.

### FAQ Sections

1. **General**: What is Vex, who are the three entities, how it differs from secondaries brokers
2. **Eligibility**: QP definition ($5M+ investments for individuals, $25M+ for institutions), KYC document requirements, geographic restrictions
3. **Catalog**: What companies are listed, how research is sourced and maintained, what starring does, content update frequency
4. **Anchor commitments**: What triggers SPV formation, $1M minimum, cash hold mechanics, what happens if anchor withdraws, countersign deadline
5. **Book build**: How bidding works, $10K minimum, FDV-based bids, binding/non-cancellable (can only raise), demand curve visibility, pseudonymous participation, how clearing works, what happens to excluded bids
6. **SPV structure**: 3(c)(7) fund, series SPV per company, standardized documents, Vex Capital as manager
7. **Fees**: 1% annual dilution (accrued quarterly as unit issuance), 5% seller commission, no carried interest, no management fee
8. **Trading and liquidity**: 12-month seasoning (Rule 144), CLOB secondary market, no liquidity guarantees, CLOB fees TBD
9. **Custody and settlement**: Transfer agent registry, book entry form, settlement mechanics
10. **Risks**: Capital loss, illiquidity, partial/no deployment possibility, concentration risk, SIPC coverage limits

## Compliance Voice (FINRA 2210)

All content must comply with these standards:

### Required
- Fair and balanced treatment of risks and potential benefits
- Sound basis for evaluating facts: every factual claim must cite a source
- Clear, not misleading in context
- If you mention a strength, pair it with a relevant risk factor

### Prohibited language
- "exciting," "revolutionary," "transformative," "groundbreaking," "disruptive"
- "poised for growth," "well-positioned to dominate," "massive opportunity"
- "next big thing," "game-changing," "best-in-class," "unparalleled"
- Any predictions about future stock price, IPO likelihood, or investment returns
- Any projections of company performance or market capture
- "guaranteed," "risk-free," "safe investment"

### Writing rules
- No dashes (em, en, or hyphens as separators/punctuation). Use colons, commas, periods, or rewrite.
- No hedging language ("could potentially," "would like to")
- No copula avoidance ("serves as," "stands as," "functions as"). Just use "is."
- No AI vocabulary cluster words (see voice-check rules)
- No puffery or significance language
- No rule-of-three patterns, negative parallelisms, false ranges

### Compliance pass
- Will need fresh CCO compliance review after content is written
- Bump control number from 202603W

## New Assets Needed

- Lifecycle Mermaid diagram (catalog > anchor > book build > clearing > deploy > season > trade)
- Demand curve concept visual (for "How Vex Works")
- Screenshot PNGs for PDF pipeline once diagrams are finalized
- Update `generate-pdf.sh` for new page order and filenames

## What Stays the Same

- Jekyll site, just-the-docs theme, dark theme, custom SCSS styling
- PDF pipeline (generate-pdf.sh, updated for new page order)
- Existing market data and statistics in "The Problem" and "Why Now"
- Google Fonts (Cormorant Garamond, DM Sans)
- GitHub Pages deployment via GitHub Actions
- CLOB trading fees left unspecified (may have fees in the future)

## Source of Truth for Platform Mechanics

All platform parameters referenced in this spec are derived from the catalog/book build design and implementation in the `potential-garbanzo` repository (workstreams 1, 2b, 3, with 4 and 5 in progress). Key source files for mechanics:

- Catalog sync: `internal/catalog/sync/`
- Book build design: `docs/superpowers/specs/2026-04-15-catalog-bookbuild-design.md`
- Deal lifecycle states: `draft > published > anchored > structuring > book_open > book_closed > deploying > settled/refunded > seasoning > tradable`
- Database schema: migrations through 00041
