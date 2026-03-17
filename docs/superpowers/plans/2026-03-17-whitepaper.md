# Vex Whitepaper Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Write and publish a 6-section marketing whitepaper on standardized private markets, deployable as both a Jekyll site (GitHub Pages) and a polished PDF.

**Architecture:** Six markdown content pages in a Jekyll site (just-the-docs, dark theme). A pandoc + pdflatex pipeline generates PDF from the same markdown source with a custom LaTeX template for cover page and typography. Mermaid diagrams render on the web; static SVGs are used in the PDF. Data charts are static SVGs referenced by both outputs.

**Tech Stack:** Jekyll 4.x, just-the-docs theme, pandoc, pdflatex (TinyTeX/BasicTeX), Mermaid 10, static SVG charts

---

## File Structure

- **Create:** `the-problem.md` (Section 1: performance data, public penalty, private penalty, thesis)
- **Create:** `the-vex-model.md` (Section 2: four standardization layers)
- **Create:** `how-it-works.md` (Section 3: lifecycle walkthrough)
- **Create:** `what-comes-next.md` (Section 4: tokenization trajectory)
- **Create:** `why-now.md` (Section 5: market timing)
- **Create:** `get-started.md` (Section 6: call to action)
- **Modify:** `index.md` (landing page with section summaries and links)
- **Create:** `_templates/whitepaper.latex` (custom LaTeX preamble: cover page, fonts, geometry, colors)
- **Create:** `generate-pdf.sh` (assemble markdown, strip Jekyll markup, run pandoc + pdflatex)
- **Create:** `_assets/` directory for static SVG charts and diagram images

---

## Chunk 1: PDF Pipeline and Infrastructure

### Task 1: Create the LaTeX template

**Files:**
- Create: `_templates/whitepaper.latex`

- [ ] **Step 1: Create the `_templates` directory and write the LaTeX preamble**

```bash
mkdir -p _templates
```

Write `_templates/whitepaper.latex` with:

```latex
% Fonts: use fontspec with a clean sans-serif (requires lualatex or xelatex)
% Fallback: use helvet package for pdflatex
\usepackage[T1]{fontenc}
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

% Geometry
\usepackage[margin=1.2in]{geometry}

% Colors
\usepackage{xcolor}
\definecolor{vexdark}{HTML}{1a1625}
\definecolor{vexaccent}{HTML}{c840c0}
\definecolor{vextext}{HTML}{e0d8ec}
\definecolor{vexlink}{HTML}{c840c0}

% Headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\fancyhead[L]{\small\textcolor{gray}{The Case for Standardized Private Markets}}
\renewcommand{\headrulewidth}{0pt}

% Section page breaks
\usepackage{titlesec}
\newcommand{\sectionbreak}{\clearpage}

% Hyperref colors
\hypersetup{
  colorlinks=true,
  linkcolor=vexlink,
  urlcolor=vexlink,
  citecolor=vexlink,
}

% Cover page command
\newcommand{\makecover}{%
  \begin{titlepage}
  \newgeometry{margin=0in}
  \pagecolor{vexdark}
  \begin{center}
  \vspace*{3in}
  {\fontsize{32}{38}\selectfont\textcolor{white}{\textbf{The Case for Standardized}}}\\[12pt]
  {\fontsize{32}{38}\selectfont\textcolor{white}{\textbf{Private Markets}}}\\[36pt]
  {\fontsize{16}{22}\selectfont\textcolor{vextext}{A Vex Platform Whitepaper}}\\[24pt]
  {\fontsize{12}{16}\selectfont\textcolor{vextext}{March 2026}}
  \end{center}
  \restoregeometry
  \nopagecolor
  \end{titlepage}
}
```

- [ ] **Step 2: Commit**

```bash
git add _templates/whitepaper.latex
git commit -m "feat: add LaTeX template for whitepaper PDF generation"
```

### Task 2: Create the PDF generation script

**Files:**
- Create: `generate-pdf.sh`

- [ ] **Step 1: Write `generate-pdf.sh`**

```bash
#!/bin/bash
# Generate a PDF of the whitepaper from the Jekyll markdown source.
# Requires: pandoc, pdflatex (BasicTeX or TinyTeX)
#
# Usage: ./generate-pdf.sh [output-path]
# Default output: ./vex-whitepaper.pdf

set -e

OUTPUT="${1:-./vex-whitepaper.pdf}"
TMPDIR=$(mktemp -d)
COMBINED="$TMPDIR/combined.md"

echo "" > "$COMBINED"

# Strip YAML frontmatter and Jekyll/Liquid markup from a page
append_page() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "" >> "$COMBINED"
        awk 'BEGIN{fm=0} /^---$/{fm++; next} fm<2{next} {print}' "$file" \
            | sed 's/{%[^%]*%}//g' \
            | sed 's/{{ site.baseurl }}//g' \
            | sed 's/{:[ ]*\.[^}]*}//g' \
            | sed '/^<div /d' \
            | sed '/^<\/div>/d' \
            >> "$COMBINED"
        echo "" >> "$COMBINED"
    fi
}

# Replace Mermaid code blocks with image references
replace_mermaid() {
    local infile="$1"
    local outfile="$2"
    awk '
    /^```mermaid/ {
        in_mermaid = 1
        # Extract a slug from the next line for image filename
        getline
        print "![Diagram](_assets/diagram-" NR ".svg)"
        next
    }
    in_mermaid && /^```/ {
        in_mermaid = 0
        next
    }
    in_mermaid { next }
    { print }
    ' "$infile" > "$outfile"
}

echo "Assembling content..."

append_page "the-problem.md"
append_page "the-vex-model.md"
append_page "how-it-works.md"
append_page "what-comes-next.md"
append_page "why-now.md"
append_page "get-started.md"

echo "Processing diagrams..."
PROCESSED="$TMPDIR/processed.md"
replace_mermaid "$COMBINED" "$PROCESSED"

echo "Generating LaTeX..."
TEXFILE="$TMPDIR/whitepaper.tex"
pandoc "$PROCESSED" \
    -f markdown \
    -t latex \
    --standalone \
    --include-in-header=_templates/whitepaper.latex \
    --toc --toc-depth=1 \
    --metadata title="" \
    -V fontsize=12pt \
    -V documentclass=article \
    --number-sections=false \
    -o "$TEXFILE"

# Inject cover page after \begin{document}
sed -i '' 's/\\begin{document}/\\begin{document}\\makecover/' "$TEXFILE"

echo "Compiling PDF (pass 1)..."
(cd "$TMPDIR" && pdflatex -interaction=nonstopmode whitepaper.tex > /dev/null 2>&1)

echo "Compiling PDF (pass 2)..."
(cd "$TMPDIR" && pdflatex -interaction=nonstopmode whitepaper.tex > /dev/null 2>&1)

cp "$TMPDIR/whitepaper.pdf" "$OUTPUT"
rm -rf "$TMPDIR"

echo "PDF generated: $OUTPUT"
```

```bash
chmod +x generate-pdf.sh
```

- [ ] **Step 2: Create the `_assets` directory**

```bash
mkdir -p _assets
touch _assets/.gitkeep
```

- [ ] **Step 3: Commit**

```bash
git add generate-pdf.sh _assets/.gitkeep
git commit -m "feat: add PDF generation script for whitepaper"
```

### Task 3: Enable Mermaid in the Jekyll config

**Files:**
- Modify: `_config.yml`

- [ ] **Step 1: Verify Mermaid is configured**

Read `_config.yml`. It should already have:

```yaml
mermaid:
  version: "10"
```

If not, add it. No commit needed if already present.

---

## Chunk 2: Content Sections 1 through 3

### Task 4: Write Section 1 (The Problem)

**Files:**
- Create: `the-problem.md`

- [ ] **Step 1: Write the full page**

The spec (Section 1) provides the complete content outline. The page must include:

Frontmatter:
```yaml
---
layout: default
title: "The Problem"
nav_order: 2
---
```

Content arc: Open with PE outperformance data (Hamilton Lane). Explain the public penalty (SOX costs from GAO, company count decline, unicorns staying private). Explain the private penalty (DPI crisis from McKinsey, hold periods, no liquidity/price discovery/portability). Secondary market proof of demand ($240B from McKinsey/Jefferies). State the thesis.

All data points must have inline citations with links. See the spec's "Data sources to cite" list.

CRITICAL WRITING RULES (from spec):
- Never use dashes of any kind (em dashes, en dashes, hyphens as separators)
- No LLM vocabulary (see spec Writing Guidelines for full banned word list)
- No forced rule-of-three, no negative parallelisms, no copula replacement
- No hedging, no elegant variation, no significance claims
- Tone: founder writing a research piece with conviction
- Inline citations with links: "...13% annualized ([Hamilton Lane](url))."

- [ ] **Step 2: Verify build**

```bash
bundle exec jekyll build 2>&1 | tail -3
```

- [ ] **Step 3: Commit**

```bash
git add the-problem.md
git commit -m "feat: add Section 1, The Problem"
```

### Task 5: Write Section 2 (The Vex Model)

**Files:**
- Create: `the-vex-model.md`

- [ ] **Step 1: Write the full page**

Frontmatter:
```yaml
---
layout: default
title: "The Vex Model"
nav_order: 3
---
```

Content arc: Four standardization layers. Each subsection solves a problem from Section 1.

1. **Legal structure:** 3(c)(7) series LLC, QP threshold, Investment Company Act exemption, weeks to launch, 2,000 holder limit via series structure.

2. **Valuation:** 100M units per company at FDV. One unit = one hundred-millionth. Series targeting X% issues X million units. Unit price = implied FDV. No preference stacks. The tradeoff (give up downside protection) and the argument (liquidity > contractual protections). Note on dilution: units are a claim on what the fund holds, not a fixed percentage.

3. **Trading:** ATS with Dutch auction (demand aggregation) and CLOB (secondary). Atomic DVP settlement. Units in the Series trade, not underlying equity. Transfer restrictions live at SPV level.

4. **Governance:** Conditional equity. Two unit classes per decision. Winner converts to unconditional units. Loser expires worthless. Price ratio = probability estimate. Everyone long the company, some short a decision. Bridge: this is simpler than a preference stack. Issuance authority: Vex Capital as fund manager. Deadlines based on observable corporate actions.

Same writing rules as Task 4.

- [ ] **Step 2: Verify build**

```bash
bundle exec jekyll build 2>&1 | tail -3
```

- [ ] **Step 3: Commit**

```bash
git add the-vex-model.md
git commit -m "feat: add Section 2, The Vex Model"
```

### Task 6: Write Section 3 (How It Works)

**Files:**
- Create: `how-it-works.md`

- [ ] **Step 1: Write the full page**

Frontmatter:
```yaml
---
layout: default
title: "How It Works"
nav_order: 4
---
```

Content arc: Lifecycle walkthrough. Seven steps: target, auction, fund formation, deployment, secondary trading, governance markets, exit. Key details per spec:

- Demand-first: buyers come first, fund forms from their conviction
- Deployment: primary and secondary channels, company doesn't initiate, partial deployment handled
- Lockup: units don't trade during deployment period
- Callback to $240B secondary market from Section 1
- Fee model: one or two sentences on management fee and auction proceeds percentage
- Short section. The point is standardized infrastructure from entry to exit.

Same writing rules.

- [ ] **Step 2: Verify build**

```bash
bundle exec jekyll build 2>&1 | tail -3
```

- [ ] **Step 3: Commit**

```bash
git add how-it-works.md
git commit -m "feat: add Section 3, How It Works"
```

---

## Chunk 3: Content Sections 4 through 6 and Index

### Task 7: Write Section 4 (What Comes Next)

**Files:**
- Create: `what-comes-next.md`

- [ ] **Step 1: Write the full page**

Frontmatter:
```yaml
---
layout: default
title: "What Comes Next"
nav_order: 5
---
```

Content arc: ATS is today. Tokenization is the bridge. DeFi is the trajectory.

- Today: book-entry settlement at transfer agent, cash via Solana USDC and Mercury wire
- Tokenization: on-chain representation of units, ownership authoritative at transfer agent
- What it enables: AMM liquidity, lending against positions, composability (indices/baskets), cross-chain settlement
- Regulatory path: GENIUS Act, Clarity Act, SEC custody modernization
- Honest framing: state what's built vs forward-looking
- Data: $33B tokenized RWA, 11% of PE participants considering tokenization

Same writing rules.

- [ ] **Step 2: Commit**

```bash
git add what-comes-next.md
git commit -m "feat: add Section 4, What Comes Next"
```

### Task 8: Write Section 5 (Why Now)

**Files:**
- Create: `why-now.md`

- [ ] **Step 1: Write the full page**

Frontmatter:
```yaml
---
layout: default
title: "Why Now"
nav_order: 6
---
```

Content arc: Three converging forces. Liquidity crisis ($240B secondaries, DPI lows, 6.7-year holds). Regulatory window (SEC custody, 17a-4 alternative, FinCEN CDD, GENIUS Act). Technology readiness (sub-second settlement, cloud compliance, passwordless auth). Close with: companies staying private longer, public companies declining, capital needs somewhere to go.

Same writing rules.

- [ ] **Step 2: Commit**

```bash
git add why-now.md
git commit -m "feat: add Section 5, Why Now"
```

### Task 9: Write Section 6 (Get Started)

**Files:**
- Create: `get-started.md`

- [ ] **Step 1: Write the full page**

Frontmatter:
```yaml
---
layout: default
title: "Get Started"
nav_order: 7
---
```

Content arc: Short. Direct. Infrastructure exists. ATS registered. Transfer agent registered. Settlement live. Two audiences: allocators (liquidity, transparency, no lock-ups) and companies (employee/early investor liquidity without going public). Links to vex.trade and contact.

Same writing rules.

- [ ] **Step 2: Commit**

```bash
git add get-started.md
git commit -m "feat: add Section 6, Get Started"
```

### Task 10: Update index.md

**Files:**
- Modify: `index.md`

- [ ] **Step 1: Rewrite the landing page**

Replace the placeholder content with a proper landing page. Include the whitepaper title, a one-paragraph summary of the thesis, and links to each section with a one-sentence description. This is the first thing a reader sees. It should be compelling enough to make them click into Section 1.

Frontmatter stays as-is (`nav_order: 1`).

- [ ] **Step 2: Verify full build**

```bash
bundle exec jekyll build 2>&1 | tail -3
```

- [ ] **Step 3: Test PDF generation**

```bash
./generate-pdf.sh /tmp/test-whitepaper.pdf
```

Expected: script completes, PDF exists at `/tmp/test-whitepaper.pdf`.

- [ ] **Step 4: Commit**

```bash
git add index.md
git commit -m "feat: update landing page with section summaries"
```

---

## Chunk 4: Visuals

### Task 11: Create Mermaid diagrams for structural content

**Files:**
- Modify: `the-vex-model.md` (add four-layer diagram and conditional equity diagram)
- Modify: `how-it-works.md` (add lifecycle flow diagram)
- Modify: `what-comes-next.md` (add today-to-tomorrow progression diagram)

- [ ] **Step 1: Add Mermaid diagrams inline in each page**

For `the-vex-model.md`: Add a diagram showing the four standardization layers (legal, valuation, trading, governance) and the problems they solve (bespoke instruments, opaque pricing, illiquidity, governance lock-in). Add a diagram showing the conditional equity flow (two unit classes, deadline, conversion/expiry).

For `how-it-works.md`: Add a lifecycle flow diagram (target → auction → fund formation → deployment → CLOB trading → exit).

For `what-comes-next.md`: Add a progression diagram (today: ATS + book entry → bridge: tokenization → tomorrow: AMMs + lending + composability).

Use Mermaid `graph` or `flowchart` syntax. Keep diagrams simple and readable. Use the neutral Mermaid theme (configured in `_config.yml`).

- [ ] **Step 2: Generate static SVG versions for PDF**

For each Mermaid diagram, render a static SVG using mermaid-cli if available:

```bash
npx -y @mermaid-js/mermaid-cli mmdc -i diagram.mmd -o _assets/diagram-name.svg -t neutral
```

If mermaid-cli is not available, create the SVGs manually or note them as TODO for later rendering.

- [ ] **Step 3: Commit**

```bash
git add the-vex-model.md how-it-works.md what-comes-next.md _assets/
git commit -m "feat: add Mermaid diagrams and static SVGs for PDF"
```

### Task 12: Create data charts for Section 1 and Section 5

**Files:**
- Create: `_assets/pe-vs-public-returns.svg` (or reference approach TBD)
- Create: `_assets/public-company-decline.svg`
- Create: `_assets/secondary-market-volume.svg`
- Modify: `the-problem.md` (add chart references)
- Modify: `why-now.md` (add timeline visual if applicable)

- [ ] **Step 1: Create static SVG charts**

These are data-driven charts that cannot be generated from Mermaid. Options:
1. Create SVGs using a charting script (Python matplotlib, d3 node script, or similar)
2. Create SVGs manually in a design tool
3. Use inline HTML/SVG in the markdown (works for both Jekyll and pandoc if kept simple)

For each chart, the data is:

PE vs public returns: $1 invested in 2015 → PE $3.96, S&P 500 $3.51, MSCI World $2.61 by 2024 (Hamilton Lane)

Public company decline: ~7,000+ in 1996 to ~3,500 in 2024 (approximate, from Columbia Business School data)

Secondary market volume: trend from ~$40B (2019) to $240B (2025) (McKinsey/Jefferies)

- [ ] **Step 2: Add image references to the relevant pages**

In `the-problem.md`, add image references after the relevant data paragraphs:

```markdown
![PE vs Public Market Returns](_assets/pe-vs-public-returns.svg)
```

- [ ] **Step 3: Test PDF with images**

```bash
./generate-pdf.sh /tmp/test-whitepaper.pdf
open /tmp/test-whitepaper.pdf
```

Verify images appear in the PDF.

- [ ] **Step 4: Commit**

```bash
git add _assets/ the-problem.md why-now.md
git commit -m "feat: add data charts for Section 1 and Section 5"
```

### Task 13: Push to remote and verify Pages deploy

- [ ] **Step 1: Push**

```bash
git push origin main
```

- [ ] **Step 2: Verify GitHub Pages deployment**

```bash
gh run list --workflow=pages.yml --limit=1 --json status,conclusion
```

Wait for `"conclusion":"success"`. The site should be live at https://vex-holdings.github.io/vex-whitepaper/
