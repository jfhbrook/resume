all: resume.pdf

resume.pdf: resume.tex
	pdflatex resume.tex

cv.pdf: cv.tex
	pdflatex cv.tex

clean: clear
	rm -f *.pdf

clear:
	rm -f *.aux
	rm -f *.log
