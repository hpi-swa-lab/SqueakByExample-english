all : iam_tr bib

bib :
	bibtex iam_tr_main
	
iam_tr :
	pdflatex iam_tr_main.tex
	pdflatex iam_tr_main.tex
	pdflatex iam_tr_main.tex


clean :
	-rm -f *.aux *.blg *.out *.bbl *.log *.dvi *.pdf *.toc
	-rm -f _chapters/*.aux _chapters/*.blg _chapters/*.out _chapters/*.bbl _chapters/*.log _chapters/*.dvi _chapters/*.pdf _chapters/*.toc