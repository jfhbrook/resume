all: resume.pdf

resume.pdf:
	pdflatex resume.tex

cv.pdf:
	pdflatex cv.tex

clean: clear
	rm -f *.pdf

clear:
	rm -f *.aux
	rm -f *.log
