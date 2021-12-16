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
    echo -e " $1 \e[32mSUCCESS\e[0m"
  fi
}
######################
#progream
######################

CheckRoot
#sudo yum install unzip -y  &>>/dev/null
#URL=$(curl -s https://www.terraform.io/downloads.html | grep "64-bit" | grep "linux_amd64.zip" | awk -F '"' '{print $2}')
#FILE_NAME=$(echo $URL | awk -F / '{print $NF}')
#curl -s -L -J -O $URL
#echo -e "\e[35m Installing Terrform \e[0m"
#unzip -o $FILE_NAME -d /bin &>>/dev/null
sudo yum install -y yum-utils &>>/dev/null
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo &>>/dev/null
sudo yum -y install terraform &>>/dev/null
exit_status "Installing Terraform is : "




#git init
#git add .
#git commit -m "first commit"
#git branch -M main
#git remote add origin https://github.com/sudheermuthyala/reff-terraform.git
#git push -u origin main
#





