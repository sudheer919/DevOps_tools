#!/bin/bash
## finding files and Directories in a path with size of a file/Directoy
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
read -p "Enter path : " -r filep
echo "Given Path is..[$filep]"
echo "File/Directory - [file path]   -   [size]"

for i in $(find "$filep" -depth);
do
#         size=$(stat -c%s "$i")
        size=`du -h`
        if [ -d $i ]
        then
                echo   -e "$G Directory$N\t[$i]\t[$R$size$N]"
        else [ -f $i ]
                echo   -e "$P File $N\t[$i]-\t[$R$size$N]"
        fi
done >outputfile.txt

echo 'Output is redirected to "outputfile.txt"'

