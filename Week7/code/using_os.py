""" This is a practice on os module to get a list of files and directories
in home directory filtered by different demands"""

# Use the subprocess.os module to get a list of files and directories 
# in your ubuntu home directory 

# Hint: look in subprocess.os and/or subprocess.os.path and/or 
# subprocess.os.walk for helpful functions

# import package
import subprocess

#################################
#~Get a list of files and 
#~directories in your home/ that start with an uppercase 'C'

# Type your code here:

# Get the user's home directory.
home = subprocess.os.path.expanduser("~")

# Create a list to store the results.
FilesDirsStartingWithC = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
    for name in (subdir + files):
        if name.startswith('C'):
            FilesDirsStartingWithC.append(subprocess.os.path.join(dir, name))

# show the directories and files
FilesDirsStartingWithC
  
#################################
# Get files and directories in your home/ that start with either an 
# upper or lower case 'C'

# Type your code here:

# Create a list to store the results.
FilesDirsStartingWithCc = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
    for name in (subdir + files):
        if name.startswith(('C', 'c')):
            FilesDirsStartingWithCc.append(subprocess.os.path.join(dir, name))

# show the directories and files
FilesDirsStartingWithCc

#################################
# Get only directories in your home/ that start with either an upper or 
#~lower case 'C' 

# Type your code here:

# Create a list to store the results.
DirsStartingWithCc = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
    for name in (subdir):
        if name.startswith(('C', 'c')):
            DirsStartingWithCc.append(subprocess.os.path.join(dir, name))

# show the directories
DirsStartingWithCc