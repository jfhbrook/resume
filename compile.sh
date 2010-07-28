#!/bin/bash
# A stupid script that builds the resume in tex.
# Will probably switch to waf or rubber or something.
python resume.py > resume.tex
pdflatex resume

