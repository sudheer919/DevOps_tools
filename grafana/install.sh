#!/bin/bash

##  Install on RPM-based Linux (CentOS, Fedora, OpenSuse, Red Hat)

#Checking Root user
if [ $(id -u) -ne 0 ]; then
    echo -e "\e[31m✗  Your must be a root user to perform this command..\e[0m"
    exit 1
fi
curl -s  https://raw.githubusercontent.com/sudheermuthyala/DevOps_tools/main/grafana/grafana.repo >/etc/yum.repos.d/grafana.repo

yum install grafana -y &>/dev/null
systemctl enable grafana-server
systemctl start grafana-server