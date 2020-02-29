.PHONY: all, src

all: resume.pdf

src: awards/*.tex education/*.tex jobs/*.tex projects/*.tex service/*.tex skills/*.tex whoami.tex

resume.pdf: resume.tex src
	pdflatex resume.tex

cv.pdf: cv.tex src
	pdflatex cv.tex

clean: clear
	rm -f *.pdf

clear:
	rm -f *.aux
	rm -f *.log
