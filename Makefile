# MIE2026 Short Communication - unified build system
# Requires: pdflatex

MAIN = article_MIE2026_meatball
TEX = pdflatex
CLS_FILE = IOS-Book-Article.cls
CLS_URL = https://raw.githubusercontent.com/vtex-soft/texsupport.IOS-Book-Article/master/IOS-Book-Article.cls

all: $(CLS_FILE) $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(TEX) $(MAIN).tex
	$(TEX) $(MAIN).tex

# Download the required class file if not present
$(CLS_FILE):
	@echo "Download $(CLS_FILE) from GitHub..."
	wget -q $(CLS_URL) -O $(CLS_FILE)
	@echo "✓ $(CLS_FILE) downloaded"

clean:
	rm -f $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc

distclean: clean
	rm -f $(MAIN).pdf

.PHONY: all clean distclean