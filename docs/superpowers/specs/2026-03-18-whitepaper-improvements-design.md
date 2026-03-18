# Whitepaper Improvements: Audience Expansion and Data Accuracy

*2026-03-18*

## Goal

Make the whitepaper serve three audiences simultaneously: (a) institutional LPs/allocators, (b) high net worth QPs without deep PE experience, and (c) potential investors in Vex Holdings itself. The current draft is optimized for (a). These changes widen the aperture for (b) and (c) without diluting the institutional-grade voice.

Secondary goal: correct data points where research found inaccuracies or outdated figures. All corrections strengthen the existing argument.

Constraint from the user: this is for public consumption targeting clients and investors. It should not be a howto for competitors or regulators. No competitor names. No unnecessary regulatory detail. The technical roadmap stays (the moat is registrations and compliance infrastructure, not architecture).

## Changes

### 1. Data Corrections

All changes are in body text. No charts need updating.

**the-problem.md:**
- SOX compliance costs: change "$1.6 million per year and 11,800 staff hours" to "$2.3 million per year and 15,580 staff hours"
- SOX source: change GAO attribution to "KPMG 2025 SOX Survey" (the GAO report exists but the cost figures originate from KPMG). Keep the GAO link for the "over 50% report costs increasing" claim if that is sourced there, otherwise update both.
- SOX initial implementation: verify whether the "$2 million to $4 million" figure also needs updating, or drop the specific range if the KPMG survey doesn't provide one for FY24.
- Distributions baseline: change "10 year average of 14%" to "2015 to 2019 average of 16%" per McKinsey's primary source.
- Hold periods: change "6.7 years" to "6.6 years" per McKinsey primary source.

**why-now.md:**
- Distributions baseline: the phrase "less than half the 10 year average" must be updated to match the corrected baseline ("less than half the 2015 to 2019 average of 16%").
- Hold periods: change "6.7 years" to "6.6 years" (same correction as the-problem.md).

**how-it-works.md:**
- Qualified purchasers: change "roughly 1.5 million US qualified purchasers" to "roughly 2.75 million US qualified purchaser households" per DQYDJ/Federal Reserve 2023 data.
- Accredited investors: "24 million" is confirmed correct per SEC data (24.3M households).

### 2. Home Page Sharpening (index.md)

Keep the existing opening paragraph. Add a "Who this is for" block immediately after, before the table of contents. Three short entries:

- **For allocators:** Continuous liquidity, real price discovery, 1% annual fee, no carried interest.
- **For companies and shareholders:** Liquidity for your people without going public.
- **For investors in Vex:** The infrastructure layer for private markets that still trade like it's 1990. (Note: if citing a specific market size figure, it must be sourced in the body text. Use McKinsey's global private markets AUM figure if available, or omit the number.)

Each entry is one line. No elaboration on the home page; the whitepaper body handles that.

### 3. ELI5 Lead-ins

Add a plain-English sentence or two before technical explanations in these sections. Never more than one sentence. Never condescending. The model is "Capital goes in. It does not come out." which the whitepaper already does perfectly.

**the-vex-model.md, Valuation section:**
Before the "100 million units at fully diluted value" explanation, add a plain-English lead-in. Note: the existing body text already contains "No preference stacks. No liquidation waterfalls. No anti-dilution provisions. One number, one unit, one price." The lead-in should complement, not duplicate, this. Focus on what it means for the investor rather than listing what's absent. Something like: "Every position has one price. You always know what it's worth."

**the-vex-model.md, Trading section:**
Before the ATS technical details, add something like: "You can sell your position whenever you want. Settlement is instant."

**the-vex-model.md, Governance section:**
Before the conditional equity explanation, add something like: "Instead of fighting for a board seat, you trade on what you think a decision is worth."

**the-problem.md, DPI/distributions language:**
On first use of "DPI (distributions to paid in capital)", add a parenthetical like "(the cash LPs have actually gotten back)".

**the-problem.md, 3(c)(7) exemption in the thesis:**
Add a parenthetical like "(a federal exemption that lets investment funds operate without the regulatory overhead of public funds, as long as every investor meets a wealth threshold)".

### 4. Competitive Positioning (the-problem.md)

Add a short passage after the secondaries discussion (after "You have a structural problem") and before "The thesis." No competitor names. No comparison charts. Content:

Platforms exist that let you sell PE positions on secondary markets. But they inherit the same structural problems: one-off bilateral transactions, NAV discounts, information asymmetry, weeks to settle. They make it easier to exit. They don't make the position liquid. The difference matters. A liquid position has continuous price discovery, instant settlement, and no counterparty negotiation. A secondary sale is still just a negotiated exit with fewer phone calls.

### 5. New Governance Page (governance.md)

New file: `governance.md` with nav_order 5. Title: "Governance Without Board Seats"

Structure:

1. **Opening scenario.** Concrete and followable: "You hold units in a $2B SaaS company. The CEO announces a pivot from SMB to enterprise. You think that's the right call. Another holder disagrees. Today, the only way to express that view is a board seat you'll never get, or a side letter no one reads. On Vex, both views trade."

2. **How it works in practice.** Walk through the mechanics using the scenario. Two conditional unit classes, both real equity, trade at prices reflecting the market's view, the winning outcome converts, the other expires. Keep binary conversion logic but anchor it in the story.

3. **What this replaces.** Brief contrast with traditional governance: board seats (largest LPs only), LPAC advisory committees (non-binding), side letters (opaque, bilateral). One paragraph.

4. **Why management should want this.** Real-time price signal on decisions. No activist investors because the mechanism is the market. Alignment without confrontation.

5. **What it doesn't do.** One sentence: this is not a hostile governance tool. Everyone is long the company. Nobody is short the equity.

No Mermaid diagram. The existing diagram in the Vex Model page covers the mechanics. This page is about the story and the why.

**Overlap management:** The Governance subsection in `the-vex-model.md` already explains conditional equity mechanics. The new page should not repeat the explanation. Instead, `the-vex-model.md` Governance subsection should stay concise (what it is) and cross-reference the new page for the full narrative (why it matters, what it replaces). The new page should reference the mechanics without re-explaining them: "As described in The Vex Model, conditional equity works by..." or similar.

### 6. Clarity Act Removal

**what-comes-next.md:**
Remove: "The expected Clarity Act (2026) would create a workable framework for digital asset classification."
Remove: "The Clarity Act has bipartisan sponsorship and committee momentum."
Tighten surrounding text so nothing reads like a gap. The regulatory path section should lean on GENIUS Act (signed into law) and SEC custody modernization (published guidance).

**why-now.md:**
Remove the Clarity Act mention from the regulatory bullet list. The remaining items (SEC custody modernization, 17a-4 alternatives, FinCEN CDD relief, GENIUS Act) are all concrete and durable.

### 7. Nav Order Update

- index.md: 1 (unchanged)
- the-problem.md: 2 (unchanged)
- the-vex-model.md: 3 (unchanged)
- how-it-works.md: 4 (unchanged)
- governance.md: 5 (new)
- what-comes-next.md: 6 (was 5)
- why-now.md: 7 (was 6)
- get-started.md: 8 (was 7)

## Files Modified

- `index.md`: add "Who this is for" block, add governance.md entry to table of contents, renumber subsequent entries
- `the-problem.md`: data corrections (SOX, distributions, hold periods), ELI5 glosses (DPI, 3(c)(7)), competitive positioning passage
- `the-vex-model.md`: ELI5 lead-ins for Valuation, Trading, Governance sections
- `how-it-works.md`: QP count correction
- `what-comes-next.md`: remove Clarity Act references, tighten regulatory section
- `why-now.md`: remove Clarity Act reference, update nav_order to 7, correct distributions baseline and hold period figures to match the-problem.md corrections
- `get-started.md`: update nav_order to 8
- `governance.md`: new file

- `generate-pdf.sh`: add `append_page "governance.md"` between `append_page "how-it-works.md"` and `append_page "what-comes-next.md"`. No Mermaid or chart changes needed (the new page has neither).

## Files Not Modified

- `_sass/custom/custom.scss`: no style changes
- `_config.yml`: no config changes
- `_assets/`: no chart or diagram updates (all corrections are in body text)

## Out of Scope

- No competitor names anywhere in the whitepaper
- No new charts or diagrams (the existing visuals are confirmed accurate)
- No restructuring of the overall argument flow
- No changes to styling, theme, or layout
- No changes to the PDF template
