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
# Note: div stripping moved to a later step (after chart replacement)
append_page() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "" >> "$COMBINED"
        awk 'BEGIN{fm=0} /^---$/{fm++; next} fm<2{next} {print}' "$file" \
            | sed 's/{%[^%]*%}//g' \
            | sed 's/{{ site.baseurl }}//g' \
            | sed 's/{:[ ]*\.[^}]*}//g' \
            >> "$COMBINED"
        echo "" >> "$COMBINED"
    fi
}

# Replace Mermaid code blocks with named PNG references
replace_mermaid() {
    local infile="$1"
    local outfile="$2"
    local names="diagram-lifecycle diagram-conditional-equity diagram-progression"

    awk -v names="$names" '
    BEGIN { split(names, arr, " "); idx=0 }
    /^```mermaid/ {
        in_mermaid = 1
        idx++
        print "![Diagram](_assets/" arr[idx] ".png)"
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

# Replace chart HTML blocks with PNG references
replace_charts() {
    local infile="$1"
    local outfile="$2"
    awk '
    /<div class="vex-chart chart-pe-returns">/ {
        in_chart = 1; depth = 1
        print "![PE vs Public Returns](_assets/chart-pe-returns.png)"
        next
    }
    /<div class="vex-chart chart-company-decline">/ {
        in_chart = 1; depth = 1
        print "![Public Company Decline](_assets/chart-company-decline.png)"
        next
    }
    /<div class="vex-chart chart-secondary-volume">/ {
        in_chart = 1; depth = 1
        print "![Secondary Market Volume](_assets/chart-secondary-volume.png)"
        next
    }
    in_chart && /<div/ && /<\/div>/ { next }
    in_chart && /<div/ { depth++; next }
    in_chart && /<\/div>/ {
        depth--
        if (depth <= 0) {
            in_chart = 0
        }
        next
    }
    in_chart { next }
    { print }
    ' "$infile" > "$outfile"
}

echo "Assembling content..."

append_page "the-problem.md"
append_page "how-vex-works.md"
append_page "why-this-model.md"
append_page "what-comes-next.md"
append_page "why-now.md"
append_page "get-started.md"

echo "Processing diagrams..."
PROCESSED="$TMPDIR/processed.md"
replace_mermaid "$COMBINED" "$PROCESSED"

echo "Processing charts..."
PROCESSED2="$TMPDIR/processed2.md"
replace_charts "$PROCESSED" "$PROCESSED2"

echo "Stripping remaining divs..."
PROCESSED3="$TMPDIR/processed3.md"
sed '/^<div /d; /^<\/div>/d' "$PROCESSED2" > "$PROCESSED3"

# Copy assets into tmpdir so pandoc can find them
cp -r _assets "$TMPDIR/"

echo "Generating LaTeX..."
TEXFILE="$TMPDIR/whitepaper.tex"
pandoc "$PROCESSED3" \
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

echo "Compiling PDF (pass 1)..."
(cd "$TMPDIR" && pdflatex -interaction=nonstopmode whitepaper.tex > /dev/null 2>&1)

echo "Compiling PDF (pass 2)..."
(cd "$TMPDIR" && pdflatex -interaction=nonstopmode whitepaper.tex > /dev/null 2>&1)

cp "$TMPDIR/whitepaper.pdf" "$OUTPUT"
rm -rf "$TMPDIR"

echo "PDF generated: $OUTPUT"
