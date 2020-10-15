#!/bin/bash
# Author: Rui rui.zhang20@imperial.ac.uk
# Script: tiff2png.sh
# Description: convert tiff file to png file
#
# Saves the output into a .png file
# Arguments: f -> tiff file
# Date: Oct 2020

for f in *.tiff;
    do 
        if [ -e $f ]
        then
            mv $f $(basename $f .tiff).tif;
            echo "Change the suffix of $f from .tiff to .tif"
        fi
    done

for f in *.tif; 
    do
        if [ -e $f ]
        then
            echo "Converting $f";
            convert "$f"  "$(basename "$f" .tif).png";
        else
            echo "There is no .tif file"
        fi 
    done
