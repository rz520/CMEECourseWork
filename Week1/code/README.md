# My First Week Code Practice Readme

## Project name: Unix, Shell and LaTeX Practice

#Brief description:

#Languages: Shell
#Dependencies: CompileLaTeX.sh depend on LaTeX installed
#Installation: guidelines for install the project, including dependencies
#Project structure and Usage: 

please remember to run these shell scripts in code directory

CompileLaTeX.sh
compile the text file into a pdf file and open the pdf file
usage:
bash CompileLaTeX.sh filename  
#remember to type the text file suffix .tex
#please install LaTeX before use this shell script
#if you are a mac user, please install evince before using this shell script, otherwise you could not use evince command

ConcatenateTwoFiles.sh
merge 2 files into a new file
usage:
bash ConcatenateTwoFiles.sh inputfile1 inputfile2 outputfile
#you should give relative paths of 2 inputfile
#you should give a new outputfile name

CountLines.sh
count the number of lines of the input file
usage:
bash CountLines.sh inputfile # the relative path of the inputfile should be given

MyExampleScript.sh
shell scripts variables usage practice
usage:
bash MyExampleScript.sh

UnixPrac1.txt
there are 5 unix shell commands with different functions dealting with fasta files in ../data
#1
#count lines in each fasta file
#2
#print E.coli.fasta from the second line
#3
#count the E.coli.fasta sequence length
#4
#count "ATGC" matches in the genome of E.coli.fasta
#5
#compute the AT/GC ratio of E.coli.fasta
usage:
bash UnixPrac1.txt

boilerplate.sh
simple boilerplate for shell scripts
usage:
bash boilerplate.sh

csvtospace.sh
substitude the commas in the file with spaces
usage:
bash csvtospace.sh inputfile # the relative path of the inputfile should be given

tabtocsv.sh
substitude the tabs in the file with commas
usage:
bash tabtocsv.sh inputfile # the relative path of the inputfile should be given

tiff2png.sh
convert tiff file to png file in the current dictionary
usage:
bash tiff2png.sh  # please make sure there are tiff files in current dictionary and put the shell script in the dictionary

variables.sh
practice 3 ways to assign values to variables in shell scripts
usage:
bash variables.sh  # please follow the direction on the screen


#Author name and contact: Rui    rui.zhang20@imperial.ac.uk
