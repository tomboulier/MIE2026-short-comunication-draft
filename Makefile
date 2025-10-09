# MIE2026 Short Communication - unified build system
# Requires: pandoc, LaTeX, and optionally wkhtmltopdf

PAPER=paper
BIB=refs.bib
CSL=iospress.csl
PANDOC_ARGS=--lua-filter=author-info-blocks.lua --lua-filter=scholarly-metadata.lua

all: $(PAPER).docx $(PAPER).pdf

$(PAPER).docx: $(PAPER).md $(BIB) $(CSL)
	pandoc $(PAPER).md \
		--from markdown \
		--to docx \
		--output $(PAPER).docx \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		--citeproc

$(PAPER).pdf: $(PAPER).md $(BIB) $(CSL)
	pandoc $(PAPER).md \
		--from markdown \
		--to pdf \
		--output $(PAPER).pdf \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		--citeproc

clean:
	rm -f $(PAPER).pdf $(PAPER).docx $(PAPER).html

# --------------------------------------------------
# Installation of dependencies on Debian-based systems (install)
# --------------------------------------------------
install:
	@echo "Installing Pandoc and LaTeX dependencies..."
	sudo apt update
	sudo apt install -y pandoc \
		texlive-latex-base \
		texlive-latex-recommended \
		texlive-fonts-recommended \
		texlive-latex-extra \
		texlive-fonts-extra \
		texlive-xetex
	@echo "Download lua filters..."
	mkdir -p filters
	cd filters
	wget https://raw.githubusercontent.com/pandoc/lua-filters/master/author-info-blocks/author-info-blocks.lua
	wget https://raw.githubusercontent.com/pandoc/lua-filters/master/scholarly-metadata/scholarly-metadata.lua
	cd ..
	@echo "✅ Installation complete."

# --------------------------------------------------
# VVerification (check)
# --------------------------------------------------
check:
	@command -v pandoc >/dev/null 2>&1 || { echo "❌ Pandoc not found"; exit 1; }
	@command -v pdflatex >/dev/null 2>&1 || { echo "❌ LaTeX not found"; exit 1; }
	@echo "✅ All dependencies present."
