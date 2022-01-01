#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"



read -p "Enter path : " -r filep
echo " file path   -   size "
for i in $(find "$filep" -depth);
do
        size=$(stat -c%s "$i")
        if [ -d $i ]
        then
                echo $i :$R Directory$N" - " $R$size$N
        else [ -f $i ]
                echo $i :$R File $N    " - "  $R$size$N
        fi
done >su.txt

