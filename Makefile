all: resume_software.pdf

resume_software.pdf:
	pdflatex resume_software.tex

resume_all.pdf:
	pdflatex resume_all.tex

clean: clear
	rm -f *.pdf

clear:
	rm -f *.aux
	rm -f *.log