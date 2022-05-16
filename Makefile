all: clean
	$(MAKE) spanish
	$(MAKE) english
	sips -s format png cv.pdf --out cv.png

spanish: clean
	pdflatex cv.tex
	pdflatex cv.tex
	mv cv.pdf cv-es.pdf
	$(MAKE) clean

english: clean
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	$(MAKE) clean

clean:
	rm -rf *.aux *.log *.out *.fls *.fdb_latexmk *.png

cleanclean: clean
	rm -rf *.pdf