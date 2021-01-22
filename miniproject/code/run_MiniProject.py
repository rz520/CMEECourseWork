#!/usr/bin/env python3

"""A workflow of miniproject combines all of R scripts, shell scripts and LATEX scripts together as a whole program"""


__appname__ = 'run_MiniProject'
__author__ = 'Rui Zhang (rui.zhang20@imperial.ac.uk)'
__version__ = '0.0.1'

## import ##
import subprocess
import sys

## functions ##
def main(argv):
    """main function of the program"""   
    # create a sub-directory for all of graphs
    subprocess.Popen(["mkdir", "../result/modelfitting"])

    # run data_preparation.R to pretreat data before fit models to experiments data 
    p1 = subprocess.Popen(["Rscript", "data_preparation.R"], stdout=subprocess.PIPE, stderr=subprocess.PIPE) 
    out1, err1 = p1.communicate()
    print(out1.decode())

    # run model_fitting.R to divide datasets and fit cubic, logistic and Gompertz model to these datasets, also AIC, BIC and Rsq are calculated
    p2 = subprocess.Popen(["Rscript", "model_fitting.R"], stdout=subprocess.PIPE, stderr=subprocess.PIPE) 
    out2, err2 = p2.communicate()
    print(out2.decode())

    # run plot_analysis.R to analyse model fitting performance deeper and visualize 
    p3 = subprocess.Popen(["Rscript", "plot_analysis.R"], stdout=subprocess.PIPE, stderr=subprocess.PIPE) 
    out3, err3 = p3.communicate()
    print(out3.decode())

    # compile LATEX using CompileLaTeX.sh 
    p4 = subprocess.Popen(["bash", "CompileLaTeX.sh", "model_fitting.tex"], stdout=subprocess.PIPE, stderr=subprocess.PIPE) 
    out4, err4 = p4.communicate()
    print(out4.decode())
    
    
    # stdout and stderr 
    #out1, err1 = p1.communicate()
    #out2, err2 = p2.communicate()
    #out3, err3 = p3.communicate()
    #out4, err4 = p4.communicate()

    #print("Miniproject running progress:")
    #print(out1.decode())
    #print(out2.decode())
    #print(out3.decode())
    #print(out4.decode())
    return 0


if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)