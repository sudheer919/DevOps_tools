#!/bin/bash

#Downloding functions
curl -s https://raw.githubusercontent.com/sudheer919/DevOps_tools/main/functions/common_functions.sh -o /tmp/functions.sh

source /tmp/functions.sh
## Checking Root User or not.
CheckRoot
##checking OS
Os_checking
#Installing Jenkins
PrintHead "Installing Java "
yum install java wget -y  &>/tmp/java.log
Stat $?

PrintHead "Adding Jenkins Repo"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo &>>/tmp/jinstall.log
Stat $?

PrintHead "Adding Key"
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
Stat $?

PrintHead "Installing Jenkins.."
sudo yum install jenkins -y &>>/tmp/jinstall.log
Stat $?

PrintHead "Starting Jenkins Server"
systemctl enable jenkins && systemctl start jenkins  &>>/tmp/jinstall.log
Stat $?
echo -e "\e[32m JENKINS INSTALLATION SUCCESSFUL\e[0m"

