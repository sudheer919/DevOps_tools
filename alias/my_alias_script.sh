#!/bin/bash
# Adding alias to /etc/profile.d/my_alias_script.sh

R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"

error() {
  echo -e "${R}✗::$1 $N"
}

CheckRoot() {
  RID=$(id -u)
  if [ $RID -ne 0 ]; then
    error "You need to be Root User to perform this command...!"
    exit 1
  fi
}
#####################
#main
CheckRoot

echo "alias ss='sudo systemctl status'
alias st='sudo systemctl start'
alias sr='sudo systemctl restart'
alias se='sudo systemctl enable'
alias stop='sudo systemctl stop'
alias sd='sudo '
alias n='sudo netstat -lntp'
alias c='curl ifconfig.co'

alias p='sudo git pull'
alias t='sudo tail -f /var/log/messages'" >> /etc/profile.d/my_auto_script.sh && su -

mkdir -R /home/centos/.ssh/
cp -u ~/.ssh/??* /home/centos/.ssh/
chown -R centos:centos /home/centos/.ssh/
git -C /home/centos/  clone git@ssh.dev.azure.com:v3/sudheerlikeu/D54/shell-scripting
su - centos
cd /home/centos/