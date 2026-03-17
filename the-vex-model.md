---
layout: default
title: "The Vex Model"
nav_order: 3
---

# The Vex Model

Vex standardizes four layers of the private equity stack. Each one solves a specific problem.

## Legal Structure

Every position on Vex is a unit in a Series of Vex SPV LLC, a Delaware series LLC operating under the [3(c)(7) exemption](https://www.law.cornell.edu/uscode/text/15/80a-3) from the Investment Company Act. One entity type. One set of docs. One compliance framework.

The gatekeeper is the Qualified Purchaser threshold: $5M+ in investments for individuals, $25M+ for institutions. This is not a workaround. It is the regulatory assumption baked into the exemption itself: qualified purchasers need access more than they need protection.

New Series launch in weeks, not months. Each Series is its own legal entity under Delaware law, which means the [2,000 holder limit](https://www.law.cornell.edu/uscode/text/15/78l) (per the JOBS Act) is managed at the Series level. One Series, one cap table, one set of holders. The structure scales horizontally.

## Valuation

Every company is 100 million units at fully diluted value. One unit equals one hundred-millionth of FDV. A Series targeting 2% of FDV issues 2 million units.

Unit price equals implied FDV. If units clear at $0.50, FDV is $50M. If $2.00, FDV is $200M.

No preference stacks. No liquidation waterfalls. No anti-dilution provisions. One number, one unit, one price.

The tradeoff is real: you give up the downside protection of preferred terms. The argument: continuous price discovery and liquidity are worth more than contractual protections that only matter in scenarios where you cannot exit anyway.

One clarification. The 100M unit standard represents FDV at the time of the auction. The unit count stays fixed. If the company raises outside funding, the fund's percentage dilutes, and the secondary market price adjusts accordingly. Units are a claim on what the fund holds, not a perpetual claim on a fixed percentage of the company.

## Trading

Units trade on a SEC-registered ATS with two mechanisms: Dutch auctions for demand aggregation and a continuous limit order book (CLOB) for secondary trading. Settlement is atomic delivery versus payment.

What trades on the ATS are units in the Series LLC, not the underlying company equity. The Series holds the restricted equity. Transfer restrictions live at the SPV level, not the unit level. This is what makes instant settlement possible: unit transfers carry no company-level right of first refusal, no board approval, no 90-day notice period.

## Governance

Conditional equity replaces control rights.

Both sides of a governance question (e.g., "company pivots to B2C before Q4" versus "company does not pivot") are represented by conditional unit classes. Both are real equity denominated in the same 100M unit standard. If your outcome happens before the deadline, your units convert to standard unconditional units. If the other outcome happens, your units expire worthless.

The relative price of the two classes is the market's probability estimate and implied valuation under each scenario. Everyone is long the company. Nobody is short the equity. But holders can be short a particular decision.

Management gets a direct price signal on what the market thinks their decisions are worth. No one needs a board seat because the market is doing the governance work.

Here is why this matters structurally: conditional equity is simpler than a liquidation waterfall. Two outcomes, binary conversion, transparent pricing. It replaces opaque board negotiations with observable market prices.

Vex Capital, as fund manager, decides when to issue conditional unit classes for material corporate decisions. Deadlines and outcomes are specified at issuance based on observable corporate actions. This mechanism is an area of ongoing design, and the specifics will evolve as the platform matures.
