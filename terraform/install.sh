#!/bin/bash
# instaling terraform for Linux centos


CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
    error "You need to be Root User to perform this command...!"
    exit 1
  fi
}
exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[31m SUCCESS\e[0m"
  fi
}
######################
#progream
######################
CheckRoot
sudo yum install unzip -y
URL=$(curl https://www.terraform.io/downloads.html | grep "64-bit" | grep "linux_amd64.zip" | awk -F '"' '{print $2}')
FILE_NAME=$(echo $URL | awk -F / '{print $NF}')
curl -s -L -J -O $URL
unzip -o $FILE_NAME -d /bin
exit_status


