#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
#PAT=`ls -lh $1`

read -p "Enter path : " filep
for file in $(find $filep );
do
      if [ -d $file ]; then
          echo -e "$G$file is a directory$N"
     elif [ -f $file ]; then
           echo -e "$P$file is a file $N"
#     else
#           echo -e "R No file found N"
      fi
done >file.txt

#for i in $(find "$filep" -depth);
