# Vex Whitepaper: Design Spec

## Purpose

A marketing whitepaper that introduces the Vex vision for standardized private markets. Target audience: qualified purchasers who already allocate to private equity and private debt. The paper should build conviction in three stages: understand the thesis, believe in the model, want to participate.

## Tone

Hybrid: structured like a research piece (sections, data, market analysis) but written with a clear point of view. Not neutral. The analysis leads to a conclusion, and the conclusion is Vex. First person where appropriate ("we" for Vex's perspective). No hedging. No LLM voice. No dashes of any kind.

## Core Thesis

Private markets consistently outperform public markets because the regulatory overhead of being public destroys value. But accessing those returns requires accepting a set of structural problems (illiquidity, opacity, GP lock-ups, bespoke instruments) and gatekeepers (GPs who control exit timing and capital return). Vex eliminates the private market penalty without importing the public market penalty, by standardizing the entire stack: legal structure, valuation, trading, and governance.

## Output

Six markdown pages in the Jekyll site at ~/vex-whitepaper, plus an updated index.md. Each page is a section of the whitepaper.

## Site Structure

```
index.md              (home/landing with section links)
the-problem.md        (Section 1)
the-vex-model.md      (Section 2)
how-it-works.md       (Section 3)
what-comes-next.md    (Section 4)
why-now.md            (Section 5)
get-started.md        (Section 6)
```

All pages use `layout: default` with `nav_order` for sequencing. No nested navigation needed.

## Section 1: The Problem

**Arc:** Private outperformance is real. The public penalty explains it. But the private penalty is the cost of accessing it. What if you could have the returns without either penalty.

**Content:**

Open with the performance data. $1 in PE in 2015 grew to $3.96 by 2024 vs $3.51 for the S&P 500 (Hamilton Lane). Since 2000, PE returned 13% annualized vs 8% for public equities. PE investors generated 19.9x net return vs 6.6x for public (Hamilton Lane). The outperformance is persistent across decades.

The public penalty. Why companies stay private: SOX compliance averages $1.6M/year, 11,800 hours (GAO). Initial implementation $2M to $4M for mid-sized companies. Over 50% of companies report increasing costs year over year. The number of US public companies dropped 50% since the 1990s. Median revenue at IPO is now $218M. Over 1,200 unicorns choosing to stay private. Short-term earnings pressure, governance constraints optimized for liability avoidance, boards that prevent innovation. The public market penalty is real and measurable, and it's why private markets outperform.

The private penalty. The cost of accessing those returns. GPs who keep capital locked for 12+ years with a DPI under 0.5. Five-year rolling DPI hit its lowest recorded level in 2025. Distributions as % of AUM fell to 6% in H1 2025 vs the 10-year average of 14% (McKinsey). Average hold periods at 6.7 years, highest in two decades. No liquidity. No price discovery (valuations are set by the last round or a GP's internal model). No portability (every instrument is bespoke: different preference stacks, different rights, different transfer restrictions). No exit when your thesis changes.

The secondary market as proof of demand. $240B in secondaries in 2025, up 48% year over year (McKinsey/Jefferies). This is LPs manufacturing liquidity that the fund structures don't provide. The demand for a real market is already here.

State the thesis: you can have the liquidity, price discovery, portability, and access of public markets without the regulatory overhead that makes public markets slow and expensive. The 3(c)(7) exemption is the regulatory vehicle. Standardization is the mechanism.

**Data sources to cite:** Hamilton Lane 2025 Market Overview, McKinsey Global Private Markets Report 2026, GAO-25-107500 (SOX compliance costs), Columbia Business School (regulatory costs and IPO decline), Bain PE Outlook 2024, CNBC (companies staying private), Moonfare (PE returns 2025).

## Section 2: The Vex Model

**Arc:** Four standardization layers, each solving a specific problem from Section 1.

**Legal structure.** Every position is a unit in a Series of Vex SPV LLC, a Delaware series LLC under the 3(c)(7) exemption. One entity type. One set of docs. One compliance framework. QP threshold ($5M+ investments for individuals, $25M+ for institutions) is the gatekeeper. 3(c)(7) is exempt from Investment Company Act registration. New Series launch in weeks. 2,000 holder limit (JOBS Act) managed through the series structure, where each Series is its own legal entity for liability. The regulatory assumption behind 3(c)(7): qualified purchasers need access more than they need protection.

**Valuation.** Every company is 100 million units at fully diluted value. One unit equals one hundred-millionth of the company. A Series targeting 2% of FDV issues 2 million units. The unit price is the market's implied FDV: if units clear at $0.50, the market says FDV is $50M. If units clear at $2.00, the market says FDV is $200M. No preference stacks. No liquidation waterfalls. No anti-dilution provisions. One number, one unit, one price. You can compare any two positions on the platform by looking at unit prices. The tradeoff: you give up the downside protection of preferred terms. The argument: continuous price discovery and liquidity are worth more than contractual protections that only matter in scenarios where you can't exit anyway.

Note: the 100M unit standard represents FDV at the time of the auction. The fund deploys capital targeting a specific ownership percentage, but the actual ownership is whatever equity the fund ends up acquiring. If the company raises outside funding afterward, the fund's percentage dilutes. The unit count stays fixed. The secondary market price adjusts to reflect the new reality. Units are a fixed claim on what the fund holds, not a perpetual claim on a fixed percentage of the company.

**Trading.** An SEC-registered ATS with two mechanisms. Dutch auctions for primary demand aggregation: qualified purchasers bid on units, a uniform clearing price is set, and the resulting capital forms the fund. A CLOB for secondary trading: price/time priority matching with atomic delivery-versus-payment settlement. No GP approval to transfer. No months of legal review. Settlement is final on execution. Note: what trades on the ATS are units in the Series LLC, not the underlying company equity. The Series itself holds the restricted equity. This is what makes instant settlement possible: the transfer restrictions live at the SPV level, not at the unit level.

**Governance.** Conditional equity, not control rights. Instead of board seats and protective provisions, Vex introduces conditional unit classes tied to specific corporate decisions. Both sides of a governance question (e.g., "company pivots to B2C before Q4" vs "company does not pivot") are represented by conditional unit classes. Both are real equity, denominated in the same 100M-unit-per-company standard. If your outcome happens before the deadline, your units convert to standard unconditional units. If the other outcome happens, your units expire worthless. The relative price of the two classes is the market's real-time probability estimate and implied valuation under each scenario.

Everyone is long the company. Nobody is short the equity. But holders can be short a particular decision. The company keeps operational freedom. Management gets a direct price signal on what the market thinks their decisions are worth. No one needs a board seat because the market is doing the governance work.

Note on "simplicity" bridge: the earlier valuation section says "no complex instruments." Conditional equity is a new instrument type, but it is structurally simpler than a liquidation waterfall. Two outcomes, binary conversion, transparent pricing. The implementer should bridge this explicitly: conditional units replace opaque board negotiations with transparent market pricing. The binary outcome is simpler than a preference stack, not more complex.

Note on issuance authority: Vex Capital (as ERA/fund manager) decides when to issue conditional unit classes for a material corporate decision. This is a fund management decision, similar to how a GP decides when to call capital or make distributions. The market then prices the decision. The manager triggers issuance; the market does the governance.

Note on deadlines and outcomes: the deadline and outcome determination are specified in the conditional unit terms at issuance (e.g., "company announces pivot to B2C in a public filing before December 31, 2027"). Outcome verification is based on observable corporate actions, not subjective judgment. The implementer should acknowledge this is an area of ongoing design without pretending it is fully solved.

## Section 3: How It Works

**Arc:** Walk through the lifecycle. Not a manual. Just enough to show the mechanics are real.

1. **Target.** Vex identifies a venture-funded company and a target ownership percentage (say 2% of FDV, which is 2 million units).

2. **Auction.** Qualified purchasers bid on units in a Dutch auction. The auction clears at a uniform price. This is demand aggregation: the buyers come first, the fund forms from their conviction.

3. **Fund formation.** The auction creates a 3(c)(7) Series. The cash raised is now the fund's capital.

4. **Deployment.** Vex Capital (the ERA managing the fund) deploys the cash to acquire actual equity in the target company through both primary channels (buying directly from the company if they're raising) and secondary channels (buying from existing shareholders, employees, early investors who want liquidity). The company does not need to initiate the process, though it may cooperate on primary transactions once approached. The demand side drives. If only partial equity is available (e.g., 0.8% instead of the target 2%), the fund deploys what it can and holds the remainder in cash or returns it pro rata. The unit price on the secondary market adjusts to reflect the actual holdings.

5. **Secondary trading.** Once the Series holds equity, units trade on the CLOB. During the deployment period (between auction close and equity acquisition), units do not trade. This is a brief lockup, analogous to the settlement period after a traditional private placement. Once deployment is complete, the CLOB opens and price discovery is continuous. The $240B secondary market exists because LPs need this. Vex makes it the default. Any holder can sell at market price at any time.

6. **Governance markets.** When a material corporate decision arises, the Series can issue conditional unit classes tied to the outcome. Holders trade between conditional and unconditional units on the same ATS. The market prices the governance question in real time.

7. **Exit.** Sell unconditional units on the CLOB. Settlement is immediate. No lock-up. No GP approval. No legal review.

Short section. The point: every step from entry to exit runs through standardized infrastructure. No bespoke negotiation at any point.

**Note on fees:** The whitepaper should briefly address how Vex makes money. The audience will expect this. Keep it to one or two sentences: Vex charges a management fee on each Series and takes a percentage of auction clearing proceeds. Exact fee structure is published in offering documents for each Series. Do not dwell on this; the point is transparency, not a fee schedule.

## Section 4: Tokenization and What Comes Next

**Arc:** The ATS is what exists today. Tokenization is the bridge. DeFi integrations are where this goes. Let the reader see the trajectory without requiring them to buy into DeFi upfront.

**Tokenization as settlement layer.** Units on the ATS are book entries maintained by Vex Registry (SEC-registered transfer agent). Tokenization means representing those same units as on-chain tokens. The ownership record stays authoritative at the transfer agent. The token is a portable representation.

**What tokenization enables:**
- DeFi liquidity via AMMs supplementing the order book
- Lending against tokenized units (private market margin lending without prime brokerage)
- Composability: third parties can bundle standardized units into indices, baskets, or structured products
- Cross-chain settlement (today Solana, portable to wherever liquidity is)

**Regulatory path.** GENIUS Act (2025), expected Clarity Act (2026), SEC custody modernization guidance (December 2025). The regulatory infrastructure for tokenized securities is arriving.

**Honest framing.** State what's built (ATS, transfer agent, USDC cash operations on Solana) vs what's forward-looking (tokenized unit representation, AMMs, lending, composability). Today, settlement on the ATS is book-entry at the transfer agent level with cash movement via Solana USDC and Mercury wire. Tokenization of the units themselves (representing ownership on-chain) is the next step. Clear line from today to tomorrow.

**Data:** $33B in tokenized real world assets as of October 2025. 11% of PE participants actively considering tokenization of secondary interests. GENIUS Act and Clarity Act changing the regulatory landscape.

## Section 5: Why Now

**Three forces converging:**

1. The liquidity crisis is acute. $240B in secondaries. DPI at historic lows. LPs actively seeking exit mechanisms.

2. The regulatory window is open. SEC custody modernization. 17a-4 audit-trail alternative. FinCEN CDD relief. GENIUS Act. More accommodating than it has been in decades.

3. The technology is ready. Sub-second blockchain settlement. Regulatory-grade cloud storage. Passwordless authentication. Operational cost is a fraction of what it was five years ago.

Companies staying private longer (median IPO revenue $218M, 1,200+ unicorns). Public companies down 50% since the 1990s. Capital needs somewhere to go. Private markets are the destination, but only if they function like markets.

## Section 6: Get Started

Short. Direct. Not a sales pitch.

The infrastructure exists. The ATS is registered. The transfer agent is registered. Units are trading. Settlement is live.

Two audiences addressed:
- Allocators: if you're tired of liquidity constraints, opacity, and GP lock-ups, this is built for you.
- Companies: if you want to offer employees and early investors real liquidity without going public, this is built for you.

Link to platform. Link to contact.

## Writing Guidelines

These rules override all defaults:

1. Never use dashes of any kind (em dashes, en dashes, hyphens as separators). Use colons, commas, periods, or rewrite.
2. No LLM vocabulary: no "pivotal", "crucial", "landscape", "tapestry", "foster", "garner", "delve", "intricate", "serves as", "stands as", "testament", "underscores", "enhance", "showcasing", "vibrant", "renowned", "nestled", "groundbreaking", "exemplifies".
3. No forced rule-of-three structures.
4. No negative parallelisms ("not just X, but Y").
5. No copula replacement ("serves as" instead of "is").
6. No elegant variation. Repeat words rather than finding synonyms.
7. No dangling participle analysis ("...highlighting the importance of", "...reflecting broader trends").
8. No "challenges and future prospects" framing.
9. No hedging. State positions directly.
10. Say "is" not "serves as". Say facts, not significance claims.
11. Short sentences to break rhythm. Then longer ones for context.
12. Specific numbers, named sources, concrete claims. No vague attributions ("experts argue", "industry reports suggest").
13. The tone is a founder writing a research piece with conviction. Not academic detachment. Not marketing puffery. The reader should feel like someone who built the thing is explaining why it matters.

## Citation Format

Inline parenthetical with links. Example: "PE returned 13% annualized vs 8% for public equities ([Hamilton Lane 2025 Market Overview](url))." No footnotes. No endnotes. The reader should be able to click through to the source without leaving the sentence.

## Visuals

Each section should include at least one chart or diagram. These are important for the marketing impact of the paper. Use Mermaid diagrams where the content is structural (flows, relationships). Use embedded charts (d3, Chart.js, or static SVG) where the content is quantitative data.

**Section 1 visuals:**
- Chart: PE vs public market returns over time (Hamilton Lane data: $1 invested in 2015, growth to 2024 for PE, S&P 500, MSCI World)
- Chart: Decline in US public companies since the 1990s
- Chart: Secondary market volume growth ($240B in 2025, year over year trend)

**Section 2 visuals:**
- Diagram: The four standardization layers (legal, valuation, trading, governance) mapped to the four problems they solve
- Diagram: Conditional equity mechanics (two unit classes, deadline, conversion/expiry outcomes)

**Section 3 visuals:**
- Diagram: Lifecycle flow from target selection through auction, fund formation, deployment, secondary trading, and exit

**Section 4 visuals:**
- Diagram: Today (ATS + book entry) to tomorrow (tokenized units + DeFi integrations) showing the progression

**Section 5 visuals:**
- Chart or timeline: Regulatory developments (GENIUS Act, Clarity Act, SEC custody modernization, FinCEN CDD relief) on a timeline

The visual style should match the site's dark theme. Clean, minimal, high contrast. No chartjunk. The data should speak.

## PDF Generation

The whitepaper must produce a polished PDF from the same markdown source files that power the Jekyll site. No separate content. One source, two outputs.

**Pipeline:** Same approach as the compliance docs site (`generate-pdf.sh` in ~/vex-compliance-docs), adapted for a marketing document with higher design standards.

```
Markdown pages (in section order)
  → assemble & strip (frontmatter, Liquid tags, Jekyll markup)
  → pandoc produces .tex (custom LaTeX template for whitepaper styling)
  → pdflatex pass 1
  → pdflatex pass 2 (resolve TOC and cross-references)
  → PDF
```

No back-of-book index needed (this is a short marketing document, not a reference manual). TOC is optional but nice to have for a 6-section paper.

**Design requirements for the PDF:**

1. **Cover page.** Title ("The Case for Standardized Private Markets"), subtitle ("A Vex Platform Whitepaper"), date, and a minimal brand mark or wordmark. Clean, dark background matching the site's color scheme. No stock photos.

2. **Typography.** Professional serif or sans-serif body font (not Computer Modern, which screams LaTeX). Consider Inter, Source Sans Pro, or a similar clean typeface. 11pt or 12pt body. Generous margins (1.2in+).

3. **Section headers.** Clear hierarchy. Section titles should be visually distinct. Page breaks before each new section.

4. **Charts and diagrams.** Mermaid diagrams render to SVG or PNG for PDF inclusion. Data charts (d3/Chart.js on the web) need static SVG or PNG equivalents for the PDF pipeline. The `generate-pdf.sh` script should handle image references automatically. Charts should look good in both the dark-themed web version and the PDF (which may use a light or dark background, TBD).

5. **Page numbers and running headers.** Page numbers in footer. Optional running header with section title.

6. **Links.** Clickable in the PDF. Blue or accent-colored, same as the web version.

**Implementation:**

- Create `generate-pdf.sh` in the repo root, similar to the compliance docs version but with a custom LaTeX template (`_templates/whitepaper.latex`) for the cover page and styling.
- Create `_templates/whitepaper.latex` with the preamble (fonts, geometry, colors, cover page layout, headers/footers).
- Create `_templates/after-body.latex` if needed (probably empty for this document).
- The script assembles pages in order (the-problem, the-vex-model, how-it-works, what-comes-next, why-now, get-started), strips Jekyll markup, and runs through pandoc + pdflatex.
- Charts that are Mermaid on the web need pre-rendered images for the PDF. Either (a) use mermaid-cli (`mmdc`) to render SVGs at build time, or (b) maintain static image files alongside the Mermaid source and reference them conditionally.

**Dual-format chart strategy:**

For each chart or diagram, maintain two representations:
- A Mermaid code block (renders on the Jekyll site via the Mermaid JS library)
- A static SVG or PNG in `_assets/` (referenced in the PDF pipeline)

The `generate-pdf.sh` script replaces Mermaid code blocks with image references during assembly. This keeps one source of truth for the content while allowing each output format to use its native rendering.

For data-driven charts (PE returns over time, secondary market volume, etc.), use static SVGs generated from a script or design tool. These are referenced as images in both the Jekyll site and the PDF.

## Commit Strategy

One commit per section page, plus one for the updated index.md, one for the PDF pipeline (generate-pdf.sh + templates), and one for shared visual assets. Nine commits total.
