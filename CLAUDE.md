# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Vex Holdings whitepaper site: a Jekyll static site using the "just-the-docs" theme, deployed to GitHub Pages. The content covers bringing public market mechanics to private equity and debt. A companion PDF is generated from the same markdown source.

## Commands

### Local development
```bash
bundle install          # install dependencies
bundle exec jekyll serve   # serve locally at http://localhost:4000/vex-whitepaper/
```

### Generate PDF
```bash
./generate-pdf.sh [output-path]   # default: ./vex-whitepaper.pdf
# Requires: pandoc, pdflatex (BasicTeX or TinyTeX)
```

### Deploy
Push to `main` triggers GitHub Actions (`.github/workflows/pages.yml`) which builds and deploys to GitHub Pages automatically.

## Architecture

### Content pages (root directory)
Markdown files with Jekyll frontmatter (`nav_order` controls sidebar ordering):
- `index.md` (Home, nav_order: 1)
- `the-problem.md`, `the-vex-model.md`, `how-it-works.md`, `what-comes-next.md`, `why-now.md`, `get-started.md`

Pages use Mermaid diagrams (rendered client-side via just-the-docs mermaid support) and inline HTML chart components styled with custom CSS classes (`vex-chart`, `vex-bars`, `vex-trend`, etc.).

### Styling
- `_sass/custom/custom.scss`: All custom styles. Dark theme with editorial typography (Cormorant Garamond for headings, DM Sans for body). Color tokens are SCSS variables prefixed `$vex-`.
- `_includes/head_custom.html`: Google Fonts preconnect links.
- `_config.yml`: Theme config, dark color scheme, Mermaid v10 enabled, search disabled.

### PDF pipeline (`generate-pdf.sh`)
Combines content pages in defined order, strips Jekyll frontmatter and Liquid tags, replaces Mermaid blocks with named PNGs from `_assets/`, replaces chart HTML blocks with corresponding PNGs, strips remaining div tags, then runs pandoc to LaTeX with a custom header (`_templates/whitepaper.latex`) and compiles with pdflatex (two passes for TOC).

### Assets
- `_assets/`: Diagram and chart PNGs used by the PDF pipeline (not served by Jekyll). Named to match the replacement logic in `generate-pdf.sh`. These are manually captured screenshots, not auto-generated. Update them when diagrams or charts change.
- `assets/`: Jekyll-served static assets.

## Key Conventions

- Ruby 3.3 is used in CI. `Gemfile.lock` is gitignored.
- Chart data is embedded as inline HTML in the markdown files (not JavaScript). The CSS classes in `custom.scss` handle all chart rendering.
- Mermaid diagram names in `generate-pdf.sh` are positional: they map to diagrams in the order they appear across all pages. Adding or reordering diagrams requires updating the `names` variable in `replace_mermaid()`.
- NEVER use dashes (em dashes, en dashes, or hyphens as separators) in any written content. Use colons, commas, periods, or rewrite the sentence instead.
