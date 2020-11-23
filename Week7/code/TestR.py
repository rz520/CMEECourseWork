import subprocess
subprocess.Popen("Rscript --verbose TestR.R > ../result/TestR.Rout 2> ../result/TestR_errFile.Rout", shell=True).wait()
