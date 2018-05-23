TARGET=sample
SRC=$(TARGET).tex
DVI=$(SRC:.tex=.dvi)
PDF=$(SRC:.tex=.pdf)
EPS=$(shell ls *.eps)
TEX=platex
DVIPDF=dvipdfmx
DIFFDIR=submit 

.SUFFIXES: .tex .dvi .pdf

all:$(PDF) 
	open $(PDF)

$(DVI): $(SRC) $(EPS)

$(PDF): $(DVI) 

.dvi.pdf:
	$(DVIPDF) $<

.tex.dvi: 
	$(TEX) $<
	$(TEX) $<

diff: diff.pdf
	open $<

diff.pdf: diff.tex

diff.tex: $(SRC)
	latexdiff $(DIFFDIR)/$(SRC) $(SRC) > diff.tex

clean:
	rm -f $(DVI) *.aux *.log *.toc *.pbm *.bmc $(PDF) diff.pdf
