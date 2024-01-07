.PHONY: all, src, open, open-cv

RESUME_PATH = ~/Software/jfhbrook/resume

all: update

src: awards/*.tex education/*.tex jobs/*.tex projects/*.tex service/*.tex skills/*.tex whoami.tex

resume.pdf: resume.tex src
	lualatex resume.tex

cv.pdf: cv.tex src
	lualatex cv.tex

everything.pdf: everything.tex src
	lualatex everything.tex

update: resume.pdf cv.pdf
	mv resume.pdf ${RESUME_PATH}/resume.pdf
	mv cv.pdf ${RESUME_PATH}/cv.pdf

clean: clear
	rm -f *.pdf

clear:
	rm -f *.aux
	rm -f *.log

open:
	kbopen ${RESUME_PATH}/resume.pdf

open-cv:
	kbopen ${RESUME_PATH}/cv.pdf

commit:
	cd ${RESUME_PATH} && git add . && git commit -m 'Update resume' && git push
