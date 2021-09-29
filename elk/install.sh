#!/bin/bash

## Predefined colors vars
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"


##Print INFO
PrintHead() {
  echo -e "${P}   ➜    INFO :: $1$N"
}

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
Stat() {
  if [ $1 -ne 0 ]; then
    echo -e "${R}   ✗    $2::  FAILED ${N}"
    exit 2
  else
    echo -e "${G}   ✓    $2::  SUCCESS ${N}"
  fi
}
###############################################
# Main Program
CheckRoot

PrintHead "Adding GPG-KEY For elasticsearch"
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
Stat $? "Adding GPG-KEY\t\t\t\t"

PrintHead "Copying elastic.repo file to yum repo"
cp elastic.repo /etc/yum.repos.d/elastic.repo
Stat $? "Adding elastic.repo\t\t\t"

PrintHead "Installing elasticsearch..."
yum install --enablerepo=elasticsearch elasticsearch -y &>>/tmp/elastic.log
Stat $? "Installing elasticsearch is\t\t"

PrintHead "Make chainges in Configuration File"
IPADDRESS=$(hostname -i | awk '{print$NF}')
sed -i -e "/network.host/ c network.host: 0.0.0.0" -e "/http.port/ c http.port: 9200" -e "/cluster.initial_master_nodes/ c cluster.initial_master_nodes: \[\"${IPADDRESS}\"\]" /etc/elasticsearch/elasticsearch.yml
Stat $? "Chainging Configuration File Is"

PrintHead "Starting elasticsearch"
systemctl enable elasticsearch &>>/tmp/elastic.log
systemctl start elasticsearch &>>/tmp/elastic.log
Stat $? "Starting elasticsearch "


