#!/bin/bash

## Colors
R="\e[31m"
#B="\e[34m"
#Y="\e[33m"
#G="\e[32m"
#BU="\e[1;4m"
#U="\e[4m"
#IU="\e[7m"
#LU="\e[2m"
N="\e[0m"

error() {
	echo -e "${R}✗  $1$N"
}

### Checking Root User or not
CheckRoot() {
	UID=$(id -u)
	if [ $UID -ne 0 ]; then
	  error You must be a root to perform this task"
	  exit 1
	fi
}

CheckRoot
