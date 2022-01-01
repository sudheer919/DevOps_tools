#!/bin/bash
#R="\e[31m"
#G="\e[32m"
#N="\e[0m"
#P="\e[35m"
##PAT=`ls -lh $1`
#
#read -p "Enter path : " filep
#for file in $(find $filep );
#do
#      if [ -d $file ]; then
#          echo -e "$G$file is a directory$N"
#     elif [ -f $file ]; then
#           echo -e "$P$file is a file $N"
#
#      fi
#done >file.txt



#!/bin/bash
read -p "Enter path : " -r filep
echo " file path   -   size "
for i in $(find "$filep" -depth);
do
        size=$(stat -c%s "$i")
        if [ $size -gt 1000 ]
        then
                echo $i " - " $size
        fi
done