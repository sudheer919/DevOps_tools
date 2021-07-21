#!/bin/bash
#varibles

R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
LID=$(id -u)

if [ $LID -ne 0 ] ;then
    echo -e "${R}You need to be A root user to run this script${N}"
    exit 1
fi

PrintHead() {
  echo -e "\e[35m➜ INFO:: $1 \e[0m"
}

PrintHead 