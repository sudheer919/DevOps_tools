#!/bin/bash

## Predefined colors vars
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"

## Print Error in Red colour
error() {
  echo -e "${R}✗::$1 $N"
}
##Print INFO
PrintHead() {
  echo -e "${P}➜ INFO::$1$N"
}
SuccessOut() {
  echo -e "${G}✓  $1 $N"
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
  else
    SuccessOut "SUCCESSFUL"
  fi
}
Os_checking() {
  ELV=$(rpm -q basesystem | sed -e 's/\./ /g' | xargs -n 1 | grep ^el)
  B_system=$(rpm -q basesystem)
  if [ $ELV != "el7" ]; then
      echo -e "\e[31merror ✗.. \e[0m OS Version not supported"
      PrintHead "${B_system} so this Script is Capabul for CentOs systems"
      exit 1
    else
      PrintHead "${B_system} so this Script is Capabul for CentOs systems"
      PrintHead "This script is Installing jenkins Server"


  fi
}
