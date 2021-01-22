# MiniProject README

## Computational Biology Techniques Concrete Exercise
## Description
This is an exercise to use different computational biology techniques integratedly to answer a 
scientific question in biology. The question I will adress here is what mathematical models 
best fit microbes population growth experiments data and try to find out underneath biological reasons. 
Here I choose 3 models: cubic polynomial model, Logistic model and Gompertz model to fit empirical 
datasets. The first model is a linear model, fitted by the means of Ordinary Least Squares (OLS). 
The second and third models are nonlinear models, fitted by the means of Nonlinear Least Squares 
(NLLS). Akaike information criterion, Schwarz criterion and the residual sum of squares are calculated 
to select which model fit best. Also, this project should be fully reproducible from data management, model 
fitting, data analysis to report creation.
There are 4 directories including code, data, result and sandbox. 
- Code contains all of the scripts.
- Data contains csv files downloaded from [CMEECourse website](https://github.com/mhasoba/TheMulQuaBio/tree/master/content/data). There is also an output file after dealing with data files.
- Result only contains a .gitignore file and a prepared report pdf file.
- Sandbox contains test files to practice command usage.

## Languages
Shell, LaTeX, Python, R

## Dependencies
Python modules: subprocess, sys
R packages: reshape2, minpack.lm and ggplot2
LaTeX packages: graphicx, caption, lineno, natbib

## Installation
Please download all of the files in a suitable directory.

## Project Structure and Usage: 
**Please remember to run these shell scripts in code directory.**
### Code
- CompileLaTeX.sh: compile the LATEX file into a pdf file as the report, save it in result directory and delete unnecessary files
- data_preparation.R: this script pretreat data before fit models to experiments data including data wrangling and unreasonable data deletion
- model_fitting.R: divide datasets and fit cubic, logistic and Gompertz model to these datasets with drawing fitting lines and saving graphs in result/modelfitting directory, also AIC, BIC and Rsq are calculated and save as csv files
- model_fitting.bib: the bibliography file of report
- model_fitting.tex: the main LATEX file of report
- plot_analysis.R: This script analyse AIC, BIC and Rsq of cubic, logistic and Gompertz model, and then draw graph and save table to visualize model fitting performance
- run_MiniProject.py: a workflow of miniproject combines all of R scripts, shell scripts and LATEX scripts together as a whole program
- titlepage.tex: a separate title page of report which will be input in model_fitting.tex

### Data
- LogisticGrowthData.csv: contains measurements of change in biomass or number of cells of microbes over time, collected from lab experiments all over the world
- LogisticGrowthMetaData.csv: a description file to explain what is the meaning of data in LogisticGrowthData.csv 
- modifiedPopulationGrowth.csv: the output file of data_preparation.R which is the final version data after preteatment used to fit models

### Result
A prepared compiled report rz520_model_fitting.pdf to show consequence of this project in case the code can not run. Also a .gitignore file is involved in result directory.


### Sandbox
All of these files are just used for testing command or scripts, usually nonsense.

## Author and contact
Rui Zhang   rui.zhang20@imperial.ac.uk