#!/bin/bash



### Checking Root User or not
CheckRoot() {
UID=$(id -u)
if [ $UID -ne 0 ]; then
  echo -e "\e[31mYou must be a root to perform this task\e[0m"
  exit 1
fi
}
