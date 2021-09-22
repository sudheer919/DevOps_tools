#!/bin/bash
# Installing Promotheus-Node-Exporter

#Checking Root user
if [ $(id -u) -ne 0 ]; then
    echo -e "\e[31m✗  Your must be a root user to perform this command..\e[0m"
    exit 1
fi
#Checking Promotheus Directory If Exist removing That directory
if [ -d /opt/prometheus ] ; then
   rm -rf /opt/prometheus
fi

URL=$(curl -s -L   https://prometheus.io/download/ | grep tar  | grep node_exporter | grep linux-amd64 |sed -e "s|>| |g" -e "s|<| |g" -e "s|\"| |g" | xargs -n1 | grep ^https | tail -1)
FILENAME=$(echo $URL | awk -F '/' '{print $NF}')
DIRNAME=$(echo $FILENAME | sed -e "s|.tar.gz| |")


cd /opt/
curl -s -L -O $URL
tar -xf $FILENAME
rm -rf $FILENAME
mv $DIRNAME node_exporter

curl -s https://raw.githubusercontent.com/sudheermuthyala/DevOps_tools/main/promotheus-server/prometheus.service >/etc/systemd/system/prometheus.service
systemctl restart prometheus
systemctl enable prometheus
