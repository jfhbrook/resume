all: software eng_researcher cv

software:
	pdflatex resume_software.tex

eng_researcher:
	pdflatex resume_eng_research.tex

cv:
	pdflatex resume_all.tex

clean: clear
	rm *.pdf

clear:
	git clean -xdf
