#!/bin/bash
LID=$(id -u)
if [ $LID -ne 0 ] ;then
    echo -e "\e[31mYou need to be A root user to run this script\e[0m"
    exit 1
fi

PrintHead() {
  echo -e "\e[35m➜ INFO:: \e[0m"
}