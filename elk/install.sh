#!/bin/bash

## Predefined colors vars
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"


##Print INFO
PrintHead() {
  echo -e "${P}➜ INFO::$1$N"
}

error() {
  echo -e "${R}✗::$1 $N"
}

CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
    error "You need to be Root User to perform this command...!"
    exit 1
  fi
}
Stat() {
  if [ $1 -ne 0 ]; then
    echo -e "${R}✗  $2  ::  FAILED ${N}"
    exit 2
  else
    echo -e "${G}✓  $2  ::  SUCCESS ${N}"
  fi
}
###############################################
# Main Program
CheckRoot

PrintHead "Adding GPG-KEY For elasticsearch"

Stat $? "Adding GPG-KEY"
