#!/usr/bin/env bash

pdflatex resume
latex2rtf resume #currently looks like ass
hevea resume #has issues with \hrule and \hfill
