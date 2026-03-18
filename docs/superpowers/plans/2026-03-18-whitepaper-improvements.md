# Whitepaper Improvements Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Widen the whitepaper's audience from institutional LPs to also serve HNW individuals and Vex company investors, while correcting data inaccuracies that strengthen the existing argument.

**Architecture:** Content-only changes across 7 existing markdown files plus 1 new file. One shell script update for the PDF pipeline. No styling, config, or template changes.

**Tech Stack:** Jekyll markdown, bash (generate-pdf.sh)

**Spec:** `docs/superpowers/specs/2026-03-18-whitepaper-improvements-design.md`

**Key constraint:** Never use dashes (em dashes, en dashes, or hyphens as separators) in any written content. Use colons, commas, periods, or rewrite.

---

### Task 1: Data corrections in the-problem.md

**Files:**
- Modify: `the-problem.md:46` (SOX costs)
- Modify: `the-problem.md:76` (distributions baseline, hold periods)

- [ ] **Step 1: Update SOX compliance figures**

In `the-problem.md`, line 46, change:

```
SOX compliance alone averages $1.6 million per year and 11,800 staff hours ([GAO](https://files.gao.gov/reports/GAO-25-107500/index.html)). Initial implementation runs $2 million to $4 million for mid-sized companies, and over 50% of public companies report those costs increasing year over year ([GAO](https://files.gao.gov/reports/GAO-25-107500/index.html)).
```

To:

```
SOX compliance alone averages $2.3 million per year and 15,580 staff hours ([KPMG 2025 SOX Survey](https://kpmg.com/us/en/articles/2025/2025-kpmg-sox-survey.html)). Over 50% of public companies report those costs increasing year over year ([GAO](https://files.gao.gov/reports/GAO-25-107500/index.html)).
```

Note: Drop the "$2 million to $4 million initial implementation" line since the KPMG FY24 survey does not provide an updated figure for this. The annual cost figure is stronger on its own.

- [ ] **Step 2: Update distributions baseline and hold periods**

In `the-problem.md`, line 76, change:

```
compared to the 10 year average of 14%
```

To:

```
compared to the 2015 to 2019 average of 16%
```

In the same paragraph, change:

```
Average buyout hold periods reached 6.7 years, the highest in two decades
```

To:

```
Average buyout hold periods reached 6.6 years, the highest in two decades
```

- [ ] **Step 3: Verify the file reads correctly**

Read `the-problem.md` lines 44-80 to confirm all edits are clean and no formatting was broken.

- [ ] **Step 4: Commit**

```bash
git add the-problem.md
git commit -m "fix: update SOX costs, distributions baseline, and hold periods with current sources"
```

---

### Task 2: Data corrections in why-now.md

**Files:**
- Modify: `why-now.md:2` (nav_order)
- Modify: `why-now.md:13` (distributions baseline, hold periods)

- [ ] **Step 1: Update nav_order**

Change `nav_order: 6` to `nav_order: 7` in the frontmatter.

- [ ] **Step 2: Update distributions baseline and hold periods**

In `why-now.md`, line 13, change the phrase:

```
less than half the 10 year average
```

To:

```
less than half the 2015 to 2019 average of 16%
```

In the same paragraph, change:

```
6.7 years
```

To:

```
6.6 years
```

- [ ] **Step 3: Verify the file reads correctly**

Read `why-now.md` lines 1-20 to confirm edits.

- [ ] **Step 4: Commit**

```bash
git add why-now.md
git commit -m "fix: update distributions baseline and hold periods in why-now, update nav_order to 7"
```

---

### Task 3: Data correction in how-it-works.md

**Files:**
- Modify: `how-it-works.md:57` (QP count)

- [ ] **Step 1: Update qualified purchaser count**

In `how-it-works.md`, line 57, change:

```
the roughly 1.5 million US qualified purchasers to the estimated 24 million accredited investor households
```

To:

```
the roughly 2.75 million US qualified purchaser households to the estimated 24 million accredited investor households
```

- [ ] **Step 2: Commit**

```bash
git add how-it-works.md
git commit -m "fix: update qualified purchaser count to 2.75M per Federal Reserve data"
```

---

### Task 4: ELI5 lead-ins in the-problem.md

**Files:**
- Modify: `the-problem.md:76` (DPI gloss)
- Modify: `the-problem.md:96` (3(c)(7) gloss)

- [ ] **Step 1: Add DPI parenthetical**

In `the-problem.md`, line 76, on first use of "DPI (distributions to paid in capital)", change:

```
Five year rolling DPI (distributions to paid in capital) hit its lowest recorded level
```

To:

```
Five year rolling DPI, distributions to paid in capital (the cash LPs have actually gotten back), hit its lowest recorded level
```

- [ ] **Step 2: Add 3(c)(7) parenthetical**

In `the-problem.md`, line 96 (in the thesis section), after "The 3(c)(7) exemption is the regulatory vehicle." add the gloss. Change:

```
The 3(c)(7) exemption is the regulatory vehicle. It allows pooled investment vehicles to operate outside the Investment Company Act when limited to Qualified Purchasers.
```

To:

```
The 3(c)(7) exemption is the regulatory vehicle: a federal exemption that lets investment funds operate without the regulatory overhead of public funds, as long as every investor meets a wealth threshold. It allows pooled investment vehicles to operate outside the Investment Company Act when limited to Qualified Purchasers.
```

- [ ] **Step 3: Verify the file reads correctly**

Read `the-problem.md` lines 74-99 to confirm edits.

- [ ] **Step 4: Commit**

```bash
git add the-problem.md
git commit -m "docs: add plain-English glosses for DPI and 3(c)(7) exemption"
```

---

### Task 5: Competitive positioning passage in the-problem.md

**Files:**
- Modify: `the-problem.md:89` (after "structural problem", before "## The thesis")

- [ ] **Step 1: Add competitive positioning passage**

After line 89 ("When investors spend $240 billion per year working around your product's limitations, you do not have a liquidity problem. You have a structural problem.") and before "## The thesis", add:

```markdown

Platforms exist that let you sell PE positions on secondary markets. But they inherit the same structural problems: one-off bilateral transactions, NAV discounts, information asymmetry, weeks to settle. They make it easier to exit. They do not make the position liquid. The difference matters. A liquid position has continuous price discovery, instant settlement, and no counterparty negotiation. A secondary sale is still just a negotiated exit with fewer phone calls.

```

- [ ] **Step 2: Verify the passage flows naturally between the surrounding sections**

Read `the-problem.md` lines 85-100 to confirm the transition from secondaries discussion to competitive positioning to thesis reads smoothly.

- [ ] **Step 3: Commit**

```bash
git add the-problem.md
git commit -m "docs: add competitive positioning passage contrasting liquidity vs secondary sales"
```

---

### Task 6: ELI5 lead-ins in the-vex-model.md

**Files:**
- Modify: `the-vex-model.md:29` (Valuation section)
- Modify: `the-vex-model.md:39` (Trading section)
- Modify: `the-vex-model.md:45` (Governance section)

**Note:** Steps 1 through 3 add content sequentially to the same file. Each insertion shifts subsequent line numbers. Use the text anchors (`## Valuation`, `## Trading`, `## Governance`) rather than line numbers for matching.

- [ ] **Step 1: Add Valuation lead-in**

After `## Valuation` (line 29) and before "Every company is 100 million units...", add:

```
Every position has one price. You always know what it's worth.

```

- [ ] **Step 2: Add Trading lead-in**

After `## Trading` (line 39) and before "Units trade on a SEC-registered ATS...", add:

```
You can sell your position whenever you want. Settlement is instant.

```

- [ ] **Step 3: Add Governance lead-in and cross-reference**

After `## Governance` (line 45, but shifted after prior insertions) and before "Conditional equity replaces control rights.", add:

```
Instead of fighting for a board seat, you trade on what you think a decision is worth.

```

Also, at the end of the Governance subsection (after "Conditional equity is simpler than a liquidation waterfall..." paragraph), add a cross-reference:

```
For a full walkthrough of how this works in practice and what it replaces, see [Governance Without Board Seats](governance.html).
```

- [ ] **Step 4: Verify the file reads correctly**

Read `the-vex-model.md` in full to confirm all lead-ins flow naturally and nothing is duplicated.

- [ ] **Step 5: Commit**

```bash
git add the-vex-model.md
git commit -m "docs: add ELI5 lead-ins for Valuation, Trading, and Governance sections"
```

---

### Task 7: Clarity Act removal from what-comes-next.md

**Files:**
- Modify: `what-comes-next.md:2` (nav_order)
- Modify: `what-comes-next.md:42-46` (regulatory section)

- [ ] **Step 1: Update nav_order**

Change `nav_order: 5` to `nav_order: 6` in the frontmatter.

- [ ] **Step 2: Remove Clarity Act references**

In `what-comes-next.md`, the regulatory section (lines 42-46) currently reads:

```
The [GENIUS Act](https://www.congress.gov/bill/119th-congress/senate-bill/1582) (2025) provides federal clarity on stablecoin settlement. The expected Clarity Act (2026) would create a workable framework for digital asset classification. SEC custody modernization guidance issued in December 2025 addresses how registered entities can hold digital assets.

These are not speculative. The GENIUS Act passed. The custody guidance is published. The Clarity Act has bipartisan sponsorship and committee momentum.
```

Replace with:

```
The [GENIUS Act](https://www.congress.gov/bill/119th-congress/senate-bill/1582), signed into law in 2025, provides federal clarity on stablecoin settlement. SEC custody modernization guidance issued in December 2025 addresses how registered entities can hold digital assets.

These are not speculative. The GENIUS Act is law. The custody guidance is published.
```

- [ ] **Step 3: Verify the file reads correctly**

Read `what-comes-next.md` lines 40-52 to confirm the regulatory section flows without gaps.

- [ ] **Step 4: Commit**

```bash
git add what-comes-next.md
git commit -m "docs: remove Clarity Act references, update nav_order to 6"
```

---

### Task 8: Home page sharpening (index.md)

**Files:**
- Modify: `index.md:11-25` (add "Who this is for" block, update TOC)

- [ ] **Step 1: Add "Who this is for" block**

After the opening paragraph (line 11) and before `## Contents`, add:

```markdown

## Who this is for

**For allocators.** Continuous liquidity, real price discovery, 1% annual fee, no carried interest.

**For companies and shareholders.** Liquidity for your people without going public.

**For investors in Vex.** The infrastructure layer for private markets that still trade like it's 1990.

```

- [ ] **Step 2: Update table of contents**

The current TOC has 6 numbered entries. Add the governance page and renumber:

```markdown
## Contents

1. [The Problem](the-problem.html): Private equity outperforms public markets, but the cost of accessing those returns is a complete absence of liquidity, price discovery, and portability.

2. [The Vex Model](the-vex-model.html): Four layers of standardization (legal structure, valuation, trading, governance) that make private market positions fungible and tradeable.

3. [How It Works](how-it-works.html): Seven steps from target identification to exit, every one running through standardized infrastructure.

4. [Governance Without Board Seats](governance.html): How conditional equity replaces board seats, advisory committees, and side letters with transparent market pricing.

5. [What Comes Next](what-comes-next.html): The ATS is what exists today. Tokenization is the bridge. DeFi integrations are where this goes.

6. [Why Now](why-now.html): The liquidity crisis is acute, the regulatory window is open, and the technology is ready.

7. [Get Started](get-started.html): The infrastructure is live. How allocators and companies can participate.
```

- [ ] **Step 3: Verify the file reads correctly**

Read `index.md` in full to confirm formatting.

- [ ] **Step 4: Commit**

```bash
git add index.md
git commit -m "docs: add audience block to home page, add governance entry to TOC"
```

---

### Task 9: New governance page (governance.md)

**Files:**
- Create: `governance.md`

- [ ] **Step 1: Write the governance page**

Create `governance.md` with this content:

```markdown
---
layout: default
title: "Governance Without Board Seats"
nav_order: 5
---

# Governance Without Board Seats

You hold units in a $2B SaaS company. The CEO announces a pivot from SMB to enterprise. You think that is the right call. Another holder disagrees. Today, the only way to express that view is a board seat you will never get, or a side letter no one reads.

On Vex, both views trade.

## How it works in practice

As described in [The Vex Model](the-vex-model.html), Vex uses conditional equity to turn governance questions into tradeable positions. Here is what that looks like.

Two conditional unit classes are created: one representing "the company pivots to enterprise" and one representing "the company does not pivot." Both are real equity, denominated in the same 100M unit standard. Both trade on the order book.

If the pivot happens before the deadline, the first class converts to standard unconditional units. The second class expires worthless. If the pivot does not happen, the reverse occurs.

The relative price of the two classes tells you everything. If "pivot" units trade at $1.20 and "no pivot" units trade at $0.80, the market is pricing a 60% probability that the pivot happens, and it is pricing the company higher under that scenario. That is not an opinion. It is capital at risk.

## What this replaces

Traditional private market governance runs on three mechanisms, none of which work well. Board seats go to the largest LPs and are limited by the number of seats available. LP advisory committees are non-binding: management can listen politely and do whatever they want. Side letters are bilateral, opaque, and create misaligned incentives across the investor base.

All three share the same flaw. They give a small number of large investors an illusion of influence while providing no actionable signal to management about what the broader market actually thinks.

## Why management should want this

Conditional equity gives management something no board meeting can: a real-time, dollar-weighted signal on what the market thinks their decisions are worth. No surveys. No advisory committee minutes. No guessing whether the largest LP's objection represents the investor base or just one allocator's house view.

The mechanism is the market itself. There are no activist campaigns because there is no need for one. If holders think a decision destroys value, the price of the corresponding conditional class drops. Management sees it immediately. The signal is continuous, transparent, and impossible to ignore.

## What this is not

This is not a hostile governance tool. Everyone holding conditional units is long the company. Nobody is short the equity. Holders can disagree about a specific decision while remaining aligned on the company's success. The market resolves the disagreement. The company keeps moving.
```

- [ ] **Step 2: Verify the file renders correctly**

Read `governance.md` in full to confirm formatting and that all links are correct.

- [ ] **Step 3: Commit**

```bash
git add governance.md
git commit -m "docs: add Governance Without Board Seats page"
```

---

### Task 10: Update nav_order for get-started.md

**Files:**
- Modify: `get-started.md:4` (nav_order)

- [ ] **Step 1: Update nav_order**

Change `nav_order: 7` to `nav_order: 8` in the frontmatter.

- [ ] **Step 2: Commit**

```bash
git add get-started.md
git commit -m "docs: update get-started nav_order to 8"
```

---

### Task 11: Update generate-pdf.sh

**Files:**
- Modify: `generate-pdf.sh:93` (add governance.md to page order)

- [ ] **Step 1: Add governance.md to the page assembly**

In `generate-pdf.sh`, after line 92 (`append_page "how-it-works.md"`) and before line 93 (`append_page "what-comes-next.md"`), add:

```bash
append_page "governance.md"
```

The resulting block should read:

```bash
append_page "the-problem.md"
append_page "the-vex-model.md"
append_page "how-it-works.md"
append_page "governance.md"
append_page "what-comes-next.md"
append_page "why-now.md"
append_page "get-started.md"
```

- [ ] **Step 2: Verify the script is syntactically valid**

Run: `bash -n generate-pdf.sh`
Expected: no output (syntax OK)

- [ ] **Step 3: Commit**

```bash
git add generate-pdf.sh
git commit -m "docs: add governance.md to PDF pipeline page order"
```

---

### Task 12: Final verification

- [ ] **Step 1: Run Jekyll build to confirm no errors**

```bash
bundle exec jekyll build 2>&1
```

Expected: successful build with no errors.

- [ ] **Step 2: Verify all nav_order values are correct**

Grep all markdown files for nav_order and confirm the sequence 1 through 8 with no duplicates:

```bash
grep -h 'nav_order' *.md | sort
```

Expected output:
```
nav_order: 1
nav_order: 2
nav_order: 3
nav_order: 4
nav_order: 5
nav_order: 6
nav_order: 7
nav_order: 8
```

- [ ] **Step 3: Spot-check cross-references**

Verify that `the-vex-model.md` links to `governance.html` and that `governance.md` links back to `the-vex-model.html`. Read relevant lines to confirm.
