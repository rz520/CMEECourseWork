import subprocess
retcode = subprocess.Popen("Rscript --verbose fmr.R > ../result/fmr.Rout 2> ../result/fmr_R_errFile.Rout", shell=True).wait()

if retcode == 0:
    print("success")
    print()
    f = open('../result/fmr.Rout')
    print(f.read())