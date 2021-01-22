#!/bin/bash
# Author: Rui rui.zhang20@imperial.ac.uk
# Script: CompileLaTeX.sh
# Description: compile the text file into a pdf file and open the pdf file
#
# Saves the output into a pdf file
# Arguments: 1 -> text file
# Date: January 2021

if [ -n "$1" ]
then
    if [ -e $1 ]
    then
        pdflatex $1
        pdflatex $1
        bibtex $(basename $1 .tex)
        pdflatex $1
        pdflatex $1
        mv $(basename $1 .tex).pdf ../result
        
        ## Cleanup
        rm *~
        rm *.aux
        rm *.dvi
        rm *.log
        rm *.nav
        rm *.out
        rm *.snm
        rm *.toc
        rm *.bbl
        rm *.blg
        rm *.fdb_latexmk
        rm *.fls

        echo "The report is stored in ../result directory, named as model_fitting.pdf"
    else
        echo "The file doesn't exist or you should type a filename with a suffix .tex"
    fi 
else
    echo "There is no input file"
fi 
