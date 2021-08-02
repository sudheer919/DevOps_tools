#!/bin/bash

## Predefined colors vars
R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
curl -s https://raw.githubusercontent.com/sudheermuthyala/DevOps_tools/main/functions/common_functions.sh -o /tmp/functions.sh
. /tmp/functions.sh

success() {
  echo -e "${G}✓  $1 $N"
}
Failed(){
  echo -e "${R}✗  $1 ${N}"
}
PrintHead() {
  echo -e "${P}➜ INFO::$1$N"
}
Stat() {
  if [ $1 -ne 0 ]; then
    echo -e "${R}✗  $2  ::  FAILED ${N}"
    exit 1
  else
    echo -e "${G}✓  $2  :: is  SUCCESS ${N}"
  fi
}
PrintHead "OS-Checking"
Os_checking
Stat $? "ChekingOS"

PrintHead "Checking user root or normaluser"
CheckRoot
Stat $? "running with root user"

PrintHead "Disabling selinux"
SElinux
Stat $? "Disabling selinux"

PrintHead "Installing Java"
yum install java -y &>/dev/null
Stat  $? "Installing java"

PrintHead "Downloading Nexus Dependencies"
yum install https://kojipkgs.fedoraproject.org/packages/python-html2text/2016.9.19/1.el7/noarch/python2-html2text-2016.9.19-1.el7.noarch.rpm -y &>/dev/null
url=$(curl -s  https://help.sonatype.com/repomanager3/download/download-archives---repository-manager-3 | html2text | grep tar.gz| head -1 |sed -e 's/</ /' -e 's/>/ /' |xargs -n1 |grep ^https)
filename=$(echo $url | awk -F / '{print $NF}')
nexusdir=$(echo $filename | sed -e 's/-unix.tar.gz/ /')
wget $url -o /tmp/${filename}
Stat $? "Downloading Nexus"

PrintHead "Creating Nexus User"
id nexus &>/dev/null
if [ $? -ne 0 ];then
  useradd nexus
else
  echo "nexus user is all readyexist"
fi
Stat $? "Adding nexus User"

PrintHead  "Extracting Nexus"
if [ ! -f "/home/nexus/$nexusdir" ] ; then
  su nexus <<EOF
  cd /home/nexus
  tar xf $filename
EOF
fi
Stat $? "Extracting Nexus"

PrintHead "## Setting Nexus starup"
unlink /etc/init.d/nexus &>/dev/null
ln -s /home/nexus/${nexusdir}/bin/nexus /etc/init.d/nexus
echo "run_as_user=nexus" >/home/nexus/${nexusdir}/bin/nexus.rc
Stat $? "Updating nexus System Configuration"

PrintHead "Starting Nexus server"
systemctl enable nexus &>/dev/null
systemctl start nexus
Stat $?  "Starting Nexus"








