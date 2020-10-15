#!/bin/bash
# Author: Rui rui.zhang20@imperial.ac.uk
# Script: variables.sh
# Description: practice 3 ways to assign values to variables in shell scripts
# Date: Oct 2020

# Shows the use of  variables
MyVar='some string'
echo 'the current value of the variable is' $MyVar
echo 'Please enter a new string'
read MyVar
echo 'the current value of the variable is' $MyVar

## Reading multiple values
echo 'Enter two numbers separated by space(s)'
read a b
echo 'you entered' $a 'and' $b '. Their sum is :'
mysum=`expr $a + $b`
echo $mysum
