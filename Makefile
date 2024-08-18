# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LATEX     = latexmk
LATEXOPTS = -synctex=1 -interaction=nonstopmode -file-line-error -pdf

.PHONY: all clean

all: rule.pdf card.pdf haunt_hero.pdf haunt_traitor.pdf

%.pdf: %.tex
	$(LATEX) $(LATEXOPTS) $<

clean:
	$(LATEX) -C
