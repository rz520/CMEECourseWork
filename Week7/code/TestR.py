#!/usr/bin/env python3
"""an exercise on subprocess module in python to run R scripts, with out and err files saved in result directory"""

import subprocess
subprocess.Popen("Rscript --verbose TestR.R > ../result/TestR.Rout 2> ../result/TestR_errFile.Rout", shell=True).wait()
