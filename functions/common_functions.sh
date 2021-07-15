#!/bin/bash


R="\e[31m"
N="\e[0m"
##Checking Root User or not

error() {
  echo -e "$R✗ :: $1 $N"
}
CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
     error You need to be Root User to perform this command...!
    exit 1
  else
    echo "Helo world"
  fi
}

CheckRoot