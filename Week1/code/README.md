# My First Week Code Practice Readme

## Unix, Shell and LaTeX Practice
## Description
This is a file that gives details and matters need attention of using these shell scrips.

## Languages
Shell and LaTeX

## Dependencies 
CompileLaTeX.sh depend on LaTeX installed

## Project structure and Usage
Please remember to run these shell scripts in code directory.

### CompileLaTeX.sh
Compile the text file into a pdf file and open the pdf file
- Usage: bash CompileLaTeX.sh filename  
- Attention
    - Remember to type the text file suffix .tex 
    - Please install LaTeX before use this shell script.
    - If you are a mac user, please install evince before using this shell script, otherwise you could not use evince command.

### ConcatenateTwoFiles.sh
Merge 2 files into a new file
- Usage: bash ConcatenateTwoFiles.sh inputfile1 inputfile2 outputfile
- Attention 
    - You should give relative paths of 2 inputfile.
    - You should give a new outputfile name.

### CountLines.sh
Count the number of lines of the input file
- Usage: bash CountLines.sh inputfile 
- Attention: The relative path of the inputfile should be given

### MyExampleScript.sh
Shell scripts variables usage practice
- Usage: bash MyExampleScript.sh

### UnixPrac1.txt
There are 5 unix shell commands with different functions dealting with fasta files in ../data
1. count lines in each fasta file
2. print E.coli.fasta from the second line
3. count the E.coli.fasta sequence length
4. count "ATGC" matches in the genome of E.coli.fasta
5. compute the AT/GC ratio of E.coli.fasta
- Usage:bash UnixPrac1.txt

### boilerplate.sh
Simple boilerplate for shell scripts
- Usage: bash boilerplate.sh

### csvtospace.sh
Substitude the commas in the file with spaces
- Usage: bash csvtospace.sh inputfile 
- Attention: The relative path of the inputfile should be given

### tabtocsv.sh
Substitude the tabs in the file with commas
- Usage: bash tabtocsv.sh inputfile 
- Attention: The relative path of the inputfile should be given

### tiff2png.sh
Convert tiff file to png file in the current dictionary
- Usage: bash tiff2png.sh  
- Attention: Please make sure there are tiff files in current dictionary and put the shell script in the dictionary

### variables.sh
Practice 3 ways to assign values to variables in shell scripts
- Usage: bash variables.sh  
- Attention: Please follow the direction on the screen


## Author and contact
Rui Zhang   rui.zhang20@imperial.ac.uk
