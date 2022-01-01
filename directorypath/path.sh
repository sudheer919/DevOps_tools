#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
#PAT=`ls -lh $1`

read -p "Enter path : " filep
for file in $filep
do
      if [ -d $file ]; then
          echo $file is a directory
     elif [ -f $file ]; then
           echo $file is a file
     else
           echo No file found
      fi
done >file.txt