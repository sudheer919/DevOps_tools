#!/bin/bash

## Predefined colors vars
R="\e[31m"
N="\e[0m"


error() {
  echo -e "$R✗ :: $1 $N"
}
##Checking Root User or not
CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
     error "You need to be Root User to perform this command...!"
    exit 1
  else
    echo "Helo world"
  fi
}

CheckRoot