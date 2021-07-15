#!/bin/bash

#Downloding functions
curl -s https://raw.githubusercontent.com/sudheer919/DevOps_tools/main/functions/common_functions.sh -o /tmp/functions.sh

source /tmp/functions.sh
## Checking Root User or not.
CheckRoot

#Installing Jenkins
PrintHead "INSTALLING "
yum install java wget -y  &>/tmp/java.log
Stat $? "Jenkins"

PrintHead "Adding Jenkins Repo"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
Stat $?
PrintHead "Adding Key"
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

