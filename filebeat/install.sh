#!/bin/bash

Y="\e[33m"
N="\e[0m"

Stat() {
  if [ $1 -ne 0 ]; then
    echo -e "${R}   ✗    $2::  FAILED ${N}"
    exit 2
  else
    echo -e "${G}   ✓    $2::  SUCCESS ${N}"
  fi
}


Print() {
  echo -e "${Y}${1}${N}"
}

##############
# Main program
##############

Print "\t\tGPG-KEY-elasticsearch"
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
Stat $? "Key Added"

Print "\t\tAdding filebeat Repository"
cp filebeat.repo  /etc/yum.repos.d/filebeat.repo
Stat $? "Repo Added to yum.repos"

Print "\t\tInstalling FileBeat..."
yum install filebeat -y &>>/tmp/filebeat.log
Stat $? "filebeat Installation is"

Print "\t\tStarting Filebeat"
systemctl start filebeat && systemctl enable filebeat &>>/tmp/filebeat.log
Stat $? "Started filebeat"

