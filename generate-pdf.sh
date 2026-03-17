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
    -V geometry:margin=1.2in \
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
