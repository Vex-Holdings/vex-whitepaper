# Remaining Updates: Roadmap, Strategy, Whitepaper Visuals, PDF

**Date:** 2026-03-17

**Scope:** Four tasks across two repos completing the work started in the previous session.

---

## Task 1: Roadmap Update

**Repo:** `~/vex-compliance-docs`
**File:** `docs/roadmap/index.md`

### Changes

**Phase 3 rewrite.** Currently titled "First N-2 Graduation" and describes a single ticker graduating. Rewrite to describe batch graduation: all existing 3(c)(7) funds file N-2s simultaneously when AI board infrastructure is ready. The product, regulatory, and business development subsections update accordingly.

**New section: Ongoing Listing Lifecycle.** Added after the Risk Register as its own top-level section (not inside any phase). Describes the permanent, repeating path every future company follows after the AI board launches:

1. Auction on QP board (Reg D/S)
2. Vex Capital deploys cash to acquire equity (primary and secondary channels)
3. Trade on QP board CLOB (after Rule 144 holding period; Ks and Qs filed to become reporting issuer)
4. File N-2, graduate to AI board when registration is effective

The QP board is a permanent pipeline. It does not shut down after the first batch graduates.

**Fee model.** Add as a new subsection under Phase 1 Product: 1% per year paid in unit dilution, starting 12 months after auction close. No carried interest. Vex Capital covers fund expenses during the initial period. After AI board launches, expenses come from the 1%.

**Warehousing.** Add to Phase 3 Product subsection (alongside the batch graduation rewrite): existing shareholders convert private shares into fund units. Available on AI board only (registered securities enable immediate trading of new units).

### What stays the same

Phases 0, 1, 2, 4, 5 structure. Ongoing Operations table. Risk Register (minor updates if needed to reflect batch graduation).

---

## Task 2: Strategy Document Update

**Repo:** `~/vex-compliance-docs`
**File:** `docs/strategy/2026-03-17-platform-strategy.md`

### Changes

**Listing Lifecycle subsection.** New subsection after Graduation Criteria in the Two-Board Architecture section. Describes the permanent path (auction → allocate → QP board CLOB → N-2 → AI board). Notes that the first batch of funds graduate simultaneously; subsequent companies follow the path individually.

**Fee Model section.** New top-level section (##) after Operational Standardization:
- 1% per year paid in unit dilution, starting 12 months after auction close
- No carried interest. No 2/20. No performance allocation.
- Vex Capital covers fund expenses during initial period (pre-AI board)
- After AI board launches, expenses come from the 1%

**Warehousing Mechanics subsection.** New subsection under the Accredited Investor Board heading, after the existing "Next-day warehousing for new unit classes" bullet:
- Shareholder converts private shares into fund units
- Fund issues new units as consideration to acquire the shares
- Dilutive to existing holders but NAV-neutral at fair value
- Available on AI board only (registered securities)
- Cost to shareholder: the fund's 1% annual fee, versus ~20% discount on back-channel secondary deals

### What stays the same

Valuation Model, Technology/Data Architecture, S-1 analysis, N-2 analysis, Conditional Equity analysis, Operational Standardization core content.

---

## Task 3: Whitepaper Visuals

**Repo:** `~/vex-whitepaper`

### Mermaid Diagrams (4)

Added inline in the markdown. Rendered by Jekyll on the site.

1. **Four-layer model** (`the-vex-model.md`): Legal structure, valuation, trading, governance as four layers. Each layer shows the problem it solves and the Vex solution. Flowchart or block diagram.

2. **Conditional equity flow** (`the-vex-model.md`): Two unit classes at issuance → deadline → binary outcome (winner converts to unconditional, loser expires worthless). Left-to-right flow.

3. **Lifecycle flow** (`how-it-works.md`): Target → Auction → Fund Formation → Deployment → CLOB Trading → Exit. Linear flow diagram.

4. **Today-to-tomorrow progression** (`what-comes-next.md`): Three stages: Today (ATS + book entry) → Bridge (tokenization) → Tomorrow (AMMs + lending + composability).

### Data Charts (3)

Inline HTML/CSS in the markdown pages. Styled to match the site's dark theme and typography. Each chart is wrapped in a container `<div>` with a unique class name for detection by the PDF script.

1. **PE vs public returns** (`the-problem.md`): Bar chart. $1 invested in 2015 → PE $3.96, S&P $3.51, MSCI $2.61 by 2024. Source: Hamilton Lane. Container class: `chart-pe-returns`.

2. **Public company decline** (`the-problem.md`): Two-point visual. ~7,000 public companies in 1996 → ~3,500 in 2024. Source: Columbia Business School. Container class: `chart-company-decline`.

3. **Secondary market volume** (`why-now.md`): Growth from ~$40B (2019) to $240B (2025). Source: McKinsey/Jefferies. Container class: `chart-secondary-volume`.

### Screenshot Naming Convention

Each visual gets a specific PNG filename in `_assets/`:

| Visual | Filename |
|---|---|
| Four-layer model | `_assets/diagram-four-layers.png` |
| Conditional equity flow | `_assets/diagram-conditional-equity.png` |
| Lifecycle flow | `_assets/diagram-lifecycle.png` |
| Today-to-tomorrow | `_assets/diagram-progression.png` |
| PE vs public returns | `_assets/chart-pe-returns.png` |
| Public company decline | `_assets/chart-company-decline.png` |
| Secondary market volume | `_assets/chart-secondary-volume.png` |

### Screenshot Workflow

1. Add all Mermaid diagrams and chart HTML to the markdown pages
2. Run `bundle exec jekyll serve` and verify all visuals render correctly in the browser
3. Screenshot each visual from the browser
4. Save PNGs to `_assets/` using the naming convention above

---

## Task 4: PDF Regeneration

**Repo:** `~/vex-whitepaper`
**File:** `generate-pdf.sh` (modifications), output PDF

### Script Changes

The existing `generate-pdf.sh` has a `replace_mermaid` function that replaces fenced Mermaid code blocks with SVG references. Update this to:

1. **Mermaid blocks:** Replace each fenced Mermaid block with a named PNG reference instead of the current auto-numbered SVG approach. Match each block by its position in the assembled markdown to the correct `_assets/diagram-*.png` filename.

2. **Chart HTML blocks:** Add a new replacement step that detects `<div class="chart-*">...</div>` container blocks and replaces each with the corresponding `![](assets/chart-*.png)` reference. Use the container class name to map to the correct PNG.

3. **Run and verify:** Generate PDF. Check: cover page renders, all six sections present, all 7 visuals appear as images, no raw Mermaid syntax or HTML markup in the output.

---

## Execution Order

1. Roadmap update (compliance docs)
2. Strategy document update (compliance docs)
3. Mermaid diagrams added to whitepaper pages
4. Data charts added to whitepaper pages
5. `bundle exec jekyll serve`, verify all visuals render in browser
6. Screenshot all visuals, save to `_assets/` with specified filenames
7. Update `generate-pdf.sh` replacement logic for named PNGs and chart HTML
8. Generate and verify PDF
9. Commit and push both repos
