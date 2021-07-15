#!/bin/bash


R="\e[31m"
N="\e[0m"
##Checking Root User or not

CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
    echo -e "$R ✗ :: You need to be Root User to perform this command...!$N"
    exit 1
  else
    echo "Helo world"
  fi
}

CheckRoot