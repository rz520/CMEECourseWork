# Week 7 README

## Biological Computing in Python II Practice
## Discription
This is a union advanced Python learning and practicing database, which contains python scripts, input data or files and some of the output files.
There are 4 directories including code, data, result and sandbox. 
- Code contains all of the scripts.
- Data contains csv files downloaded from [CMEECourse website](https://github.com/mhasoba/TheMulQuaBio/tree/master/content/data). There is also an output file when practicing. 
- Result only contains a .gitignore file.
- Sandbox contains test files to practice command usage.

## Languages
Python, R

## Dependencies
Python modules: scipy, numpy, matplotlib.pylab, sys, subprocess, re, cProfile, timeit

## Installation
Please download all of the files in a suitable directory.

## Project Structure and Usage: 
**Please remember to run these shell scripts in code directory.**
### Code
- LV1.py: numerical integration exercise using scipy, an example about Lotka-Volterra model
- LV2.py: fit the Lotka-Volterra with prey density dependence rR(1 - R/K), plot and save population dynamics between consumer and resource with input from command line
- LV3.py: fit the Lotka-Volterra with prey density dependence rR(1 - R/K), plot and save population dynamics between consumer and resource with input from command line, discrete time version (group work)
- LV4.py: fit the Lotka-Volterra with prey density dependence rR(1 - R/K), plot and save population dynamics between consumer and resource with input from command line, discrete time version with random gaussion fluctuation on resource (group work)
- LV5.py: fit the Lotka-Volterra with prey density dependence rR(1 - R/K), plot and save population dynamics between consumer and resource with input from command line, discrete time version with random gaussion fluctuation on resource and consumer (group work)
- TestR.R: test file to exercise subprocess module in python
- TestR.py: an exercise on subprocess module in python to run R scripts, with out and err files saved in result directory
- blackbirds.py: practice on regular expressions in python, catching Kingdom, Phylum and Species names in a txt file
- fmr.R: draw log(field metabolic rate) against log(body mass) for the NagyEtAl1999.csv dataset and save the graph to a file fmr_plot.pdf in result directory
- profileme.py: to findout what is slowing down code, we need to profile code write an illustrative program, here is a loop version
- profileme2.py: to findout what is slowing down code, we need to profile code write an illustrative program, here is a comprehension version
- regexs.py: some regexes examples in python using re module
- run_LV.py: Runs the LV1.py, LV2.py, LV3.py, LV4.py and LV5.py with the appropriate parameters using subprocess and checks for speed bottlencks using CProfile (group work)
- run_fmr_R.py: an excercise on subprocess module in python to run a more complicated R script drawing a graph saved in result
- timeitme.py: quick profiling with timeit to figure out what the best way to do some specific as part of a larger program might be
- using_os.py: this is a practice on os module to get a list of files and directories in home directory filtered by different demands


### Data
- Input files: NagyEtAl1999.csv, blackbirds.txt
- Output files: TestOaksData.csv

### Result
An empty directory as origin version only with a .gitignore.

### Sandbox
All of files are just used for testing command or scripts, usually nonsense.

## Author and contact
Rui Zhang   rui.zhang20@imperial.ac.uk