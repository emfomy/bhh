# Requires TeX Live 2025 (https://tug.org/texlive/)
LATEX     = latexmk
LATEXOPTS = -g

.PHONY: all clean

all: rule.pdf card.pdf haunt_hero.pdf haunt_traitor.pdf

%.pdf: %.tex
	$(LATEX) $(LATEXOPTS) $<

clean:
	$(LATEX) -C
