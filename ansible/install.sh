#!/bin/bash 
# Installing Anisible Latest versino
# sudo yum remove ansible -y 
# rm -rf /usr/lib/python2.7/site-packages/ansible*
# sudo yum install python3 -y
# sudo pip3 install ansible  --user ansible



PRINT() {
     echo -e  "\e[33m-------------------------------------------------------------"
     echo -e  "\e[1;35m[INFO] :: $1 \e[0m"
     echo -e  "\e[33m-------------------------------------------------------------"
}

STAT() {

if [ $1 -ne 0 ] ; then
    echo -e "\e[1;31m[INFO] :: $2..IS FAILED"
  else
    echo -e "\e[1;31m[INFO] :: $2..IS SUCCESS"
fi

}

PYTHON3() {
    python3 --version

    if [ $? -ne 0 ]; then
        sudo yum install python3 -y &>/dev/null
        else
        echo "$(python3 --version) Is Installed Nothing to Do"
    fi 
}

PRINT "DOWNLOADING...get-pip.py"
GETPIPPY=./get-pip.py 
echo "To manually install pip, securely 1 download get-pip.py"
[[ -e $GETPIPPY ]] ||  curl -s  https://bootstrap.pypa.io/get-pip.py -o get-pip.py
STAT $? "DOWNLOADING...get-pip.py"

PRINT "Installing Python3*"
PYTHON3
STAT $? "Installing $(python --version)"

PRINT  "Installing python get-pip"
python3 get-pip.py
STAT $? "Installing python get-pip"

PRINT "Installing Ansible"
pip install ansible
STAT $? "installing Ansible"
ansible --version

