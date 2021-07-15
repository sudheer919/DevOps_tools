#!/bin/bash

## Predefined colors vars
R="\e[31m"
N="\e[0m"
P="\e[35m"

## Print Error in Red colour
error() {
  echo -e "$R✗::$1 $N"
}
##Print INFO
PrintHead(){
  echo -e "$P➜ INFO::$1$N"
}

##Checking Root User or not
CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
     error "You need to be Root User to perform this command...!"
     exit 1
  fi
}
## Status checking
Stat() {
    if [ $1 -ne 0 ]; then
        error "Install Failed ::: Check log file /tmp/function.log"
        exit 2
    fi
}

