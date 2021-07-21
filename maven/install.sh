#!/bin/bash
#varibles

R="\e[31m"
G="\e[32m"
N="\e[0m"
P="\e[35m"
LID=$(id -u)
LOG=/tmp/mvn.log
Mvn_Ver=$(curl -s  https://maven.apache.org/download.cgi | grep "Downloading"| awk '{print $5}' | awk -F '<' '{print $1}')

if [ $LID -ne 0 ] ;then
    echo -e "${R}You need to be A root user to run this script${N}"
    exit 1
fi

PrintHead() {
  echo "----------------------------"
  echo -e "\e[35m➜ INFO:: $1 \e[0m\n"
  
}

Stat(){
    if [ $1 -ne 0 ] ;then 
        echo -e "${R}✗${N}  $2 ${R}UNSUCCESSFUL${N}"
        echo -e "${R}✗${N}""Check ${R}$LOG${N}"
        exit
    else
        echo -e "${G}✓${N}  $2 ${G}SUCCESS${N}"
        echo "----------------------------"
    fi
}
PrintHead "Installing Java"
yum install java-1.8.0-openjdk-devel unzip  -y &>>$LOG
Stat $? "Installing java is ::"

PrintHead "Downloading latest maven-${Mvn_Ver}"
cd /opt/
curl -s https://downloads.apache.org/maven/maven-3/${Mvn_Ver}/binaries/apache-maven-${Mvn_Ver}-bin.zip -o /tmp/apache-maven-${Mvn_Ver}-bin.zip
Stat $? "Downloading maven${Mvn_Ver}"

PrintHead "Moving mvn command to /bin/mvn"
unzip -o /tmp/apache-maven-${Mvn_Ver}-bin.zip &>>$LOG
mv apache-maven-${Mvn_Ver} maven
ln -s /opt/maven/bin/mvn  /bin/mvn
Stat $? "mvn command is added to /bin is ::"

PrintHead 'check with "mvn" command'






