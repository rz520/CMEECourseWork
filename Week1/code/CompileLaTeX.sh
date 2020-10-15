#!/bin/bash
# Author: Rui rui.zhang20@imperial.ac.uk
# Script: CompileLaTeX.sh
# Description: compile the text file into a pdf file and open the pdf file
#
# Saves the output into a pdf file
# Arguments: 1 -> text file
# Date: Oct 2020

pdflatex $1.tex
pdflatex $1.tex
bibtex $1
pdflatex $1.tex
pdflatex $1.tex
evince $1.pdf &    #if you are a mac user, please install evince at first

## Cleanup
rm *~
rm *.aux
rm *.dvi
rm *.log
rm *.nav
rm *.out
rm *.snm
rm *.toc
