---
layout: default
title: "The Vex Model"
nav_order: 3
---

# The Vex Model

Vex standardizes four layers of the private equity stack. Each one solves a specific problem.

## Legal Structure

Every position on Vex is a unit in a Series of Vex SPV LLC, a Delaware series LLC. Each Series is a single-asset SPV holding equity in one private company. One entity type. One set of docs. One compliance framework.

The platform operates two boards with different regulatory regimes:

**The QP Board** operates under the [3(c)(7) exemption](https://www.law.cornell.edu/uscode/text/15/80a-3) from the Investment Company Act. Limited to Qualified Purchasers ($5M+ in investments for individuals, $25M+ for institutions). This is where every Series starts: Dutch auctions, initial fund formation, and early secondary trading. The [2,000 holder limit](https://www.law.cornell.edu/uscode/text/15/78l) (per the JOBS Act) applies at the Series level, so minimum position sizes are enforced to manage capacity. New Series launch in weeks.

**The Accredited Investor Board** is for popular tickers that graduate by filing an [N-2 registration statement](https://www.sec.gov/about/divisions-offices/division-investment-management/investment-company-registration-regulation-package) under the Investment Company Act. Registration removes the holder cap, removes minimum position sizes, opens access to accredited investors (a much larger pool than QPs), and enables conditional equity classes that can trade immediately with no Rule 144 delay. This is where governance markets live.

One board of directors covers all SPVs: three Vex officers and two independents. One Chief Compliance Officer. The governance overhead is shared, not duplicated per Series.

The graduation model matches regulatory cost to revenue. 3(c)(7) is cheap and fast for new tickers. Registration is worth it only when a ticker has enough demand to justify the overhead. The platform scales the compliance investment with the trading activity.

## Valuation

Every company is 100 million units at fully diluted value. One unit equals one hundred-millionth of FDV. A Series targeting 2% of FDV issues 2 million units.

Unit price equals implied FDV. If units clear at $0.50, FDV is $50M. If $2.00, FDV is $200M.

No preference stacks. No liquidation waterfalls. No anti-dilution provisions. One number, one unit, one price.

The tradeoff is real: you give up the downside protection of preferred terms. The argument: continuous price discovery and liquidity are worth more than contractual protections that only matter in scenarios where you cannot exit anyway.

One clarification. The 100M unit standard represents FDV at the time of the auction. The unit count stays fixed. If the company raises outside funding, the fund's percentage dilutes, and the secondary market price adjusts accordingly. Units are a claim on what the fund holds, not a perpetual claim on a fixed percentage of the company.

## Trading

Units trade on a SEC-registered ATS with two mechanisms: Dutch auctions for demand aggregation and a continuous limit order book (CLOB) for secondary trading. Settlement is atomic delivery versus payment. Both boards use the same ATS infrastructure.

On the QP Board, the CLOB opens six months after auction close (Rule 144 holding period for reporting issuers). On the Accredited Investor Board, new unit classes (including conditional equity) can trade immediately because registered securities have no holding period.

What trades on the ATS are units in the Series LLC, not the underlying company equity. The Series holds the restricted equity. Transfer restrictions live at the SPV level, not the unit level. This is what makes instant settlement possible: unit transfers carry no company-level right of first refusal, no board approval, no 90-day notice period.

## Governance

Conditional equity replaces control rights. This feature is available on the Accredited Investor Board, where registered Series can issue and trade new unit classes immediately.

Both sides of a governance question (e.g., "company pivots to B2C before Q4" versus "company does not pivot") are represented by conditional unit classes. Both are real equity denominated in the same 100M unit standard. If your outcome happens before the deadline, your units convert to standard unconditional units. If the other outcome happens, your units expire worthless.

The relative price of the two classes is the market's probability estimate and implied valuation under each scenario. Everyone is long the company. Nobody is short the equity. But holders can be short a particular decision.

Management gets a direct price signal on what the market thinks their decisions are worth. No one needs a board seat because the market is doing the governance work.

Here is why this matters structurally: conditional equity is simpler than a liquidation waterfall. Two outcomes, binary conversion, transparent pricing. It replaces opaque board negotiations with observable market prices.

Vex Capital, as fund manager, decides when to issue conditional unit classes for material corporate decisions. Deadlines and outcomes are specified at issuance based on observable corporate actions. This mechanism is an area of ongoing design, and the specifics will evolve as the platform matures.

## Operational Standardization

Every SPV is structurally identical. One asset. One data source. One set of documents. One board. One compliance officer. The only variable is which company's stock the Series holds and what Carta says the 409A valuation is. Everything else is templated.

The same papers. The same reporting (the only inputs are ownership percentage and 409A from Carta). The same officers and directors across every SPV. The marginal cost of launching a new Series approaches the filing fee plus legal review. The board meeting to approve a new Series is a line item on an agenda, not a new engagement. The N-2 for graduation is a template with one field changed. The Ks and Qs are automated pulls from one data source.

Traditional PE fund administration is expensive because every fund is different: different terms, different waterfalls, different reporting requirements, different service providers. When every SPV is the same, you get assembly-line economics. The standardization argument that makes the investment structure work also makes the operations work.
