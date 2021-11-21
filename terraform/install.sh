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
    echo -e "\e[33m $1  SUCCESS\e[0m"
  fi
}
######################
#progream
######################

CheckRoot
sudo yum install unzip -y  &>>/dev/null
URL=$(curl -s https://www.terraform.io/downloads.html | grep "64-bit" | grep "linux_amd64.zip" | awk -F '"' '{print $2}')
FILE_NAME=$(echo $URL | awk -F / '{print $NF}')
curl -s -L -J -O $URL
echo -e "\e[35m Installing Terrform \e[0m"
unzip -o $FILE_NAME -d /bin &>>/dev/null
exit_status "Installing Terraform is : "


