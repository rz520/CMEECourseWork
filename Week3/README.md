# Week 3 README

## Biological Computing in R Practice
## Discription
This is a union R learning and practicing database, which contains r scripts, input data or files and some of the output files.
There are 4 directories including code, data, result and sandbox. 
- Code contains all of the r scripts.
- Data contains 6 csv files and 2 RData files downloaded from [CMEECourse website](https://github.com/mhasoba/TheMulQuaBio/tree/master/content/data). 
- Result only contains a .gitignore file.
- Sandbox contains test files to practice command usage.

## Languages
R, Python, shell

## Dependencies
R packages: maps, ggplot2, tidyvere, dplyr, broom
Python modules: numpy, sys, time, csv, os, pandas

## Installation
Please download all of the files in a suitable directory.

## Project Structure and Usage: 
**Please remember to run these shell scripts in code directory.**
### Code
- DataWrang.R: Wrangling the Pound Hill Dataset
- DataWrangTidy.R: use tidyverse package command to Wrangle the Pound Hill Dataset
- GPDD_Data.R: using the maps package in R to do mapping with Global Population Dynamics Database(GPDD)
- Girko.R： draw the results of a simulation displaying Girko's circular law
- MyBars.R: use ggplot geom_text to annotate a plot
- PP_Dists.R: draw and save 3 graphics relatively for distribution of log(Predator mass), log(Prey mass) and the size ratio of Prey mass over Predator mass, containing subplots by Type.of.feeding.interaction
- PP_Regress.R: draw and save a pdf file showing linear regression of 18 subsets (all available Feeding Type * Predator life stage combination) of the data and calculate regression results exported to a formatted table in csv
- PP_Regress_loc.R: regression analysis, calculates statistics from the EcolArchives-E089-51-D1.csv in data directory, stores all results of an analysis of Linear regression on subsets of the data corresponding to available Feeding Type x Predator life Stage x Location combination, saved in result directory PP_Regress_loc_Results.csv (group work)
- R_conditionals.R: some examples of functions with conditionals
- Ricker.R: a script shows Ricker model which is a classic discrete population model
- SQLinR.R: R can also also be used to access, update and manage databases, use SQLite to build, manipulate, and access databases
- TAutoCorr.R: autocorrelation in weather, answering whether temperatures of one year are significantly correlated with the next year, across years in a given location
- TAutoCorr.tex: a latex file illustrating TAutoCorr.R results
- TreeHeight.R: This script reads a csv file containing trees' species, distance and angle, calculates all of the trees' height, then append heights to the origin csv file as a new csv file stored in ../result
- Vectorize1.R: an example illustrating that vectorization can optimize code computational efficiency and make code more concise, easy to read, less prone
- Vectorize1.py: python version of Vectorize1.R (group work)
- Vectorize2.R: Runs the stochastic Ricker equation with gaussian fluctuations in non-vectorization way and vectorization way
- Vectorize2.py: python version of Vectorize2.R (group work)
- apply1.R: use apply to vectorize code, applying the same function to rows/columns of a matrix
- apply2.R: use apply to define your own functions
- basic_io.R: A simple script to illustrate R input-output.
- boilerplate.R: A boilerplate R script
- break.R: a control flow tool, break, is useful to break out of loops when some condition is met
- browse.R: use browser() to debug script, inserting a breakpoint in code and then stepping throuth code
- control_flow.R: control flow tools in R including if, then, else and for and while loops
- get_TreeHeight.R: calculates heights of trees using the trigonometric formula, takes input file from command line to run, and save output in result directory with the same name as the input file with _treeheights.csv extension (group work)
- get_TreeHeight.py: python version of get_TreeHeight.R (group work)
- next.R: a control flow tool, next, is used to skip to next iteration of a loop
- plotLin.R: mathematical annotation on a axis and in the plot area
- preallocate.R: an example shows pre-allocate a vector can make results faster
- run_Vectorize.sh: runs all the Vectorize scripts and shows the time they take to run (group work)
- run_get_TreeHeight.sh: runs both get_TreeHeight R and Python scripts with all needed arguements (group work)
- sample.R: an example of vectorization involving lapply and sapply
- try.R: use try keyword to catch the error and keep going instead of having R throw you out

### Data
- EcolArchives-E089-51-D1.csv: import file of PP_Dists.R and PP_Regress.R
- GPDDFiltered.RData: import file of GPDD_Data.R			
- KeyWestAnnualMeanTemperature.RData: import file of TAutoCorr.R
- PoundHillData.csv: import file of DataWrang.R and DataWrangTidy.R
- PoundHillMetaData.csv: import file of DataWrang.R and DataWrangTidy.R
- Resource.csv: import file of SQLinR.R
- Results.txt: import file of MyBars.R
- trees.csv: import file of TreeHeight.R

### Result
An empty directory as origin version only with a .gitignore.

### Sandbox
There is only a pdf file for TAutoCorr.tex

## Author and contact
Rui Zhang   rui.zhang20@imperial.ac.uk