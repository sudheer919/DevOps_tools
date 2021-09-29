#!/bin/bash

## Predefined colors vars
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"

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
CheckRoot
echo "Hello Sudheer Writing Script For ELK"

Stat $? "ok"
