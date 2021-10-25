#!/bin/bash
##!/bin/bash
#yum install python3-pip -y
#pip3 install pip --upgrade
#pip3 install ansible==4.1.0
yum install python3-pip -y
pip3 install pip --upgrade
pip3 install ansible==4.1.0

# # Installing Anisible Latest versino
# # sudo yum remove ansible -y 
# # rm -rf /usr/lib/python2.7/site-packages/ansible*
# # sudo yum install python3 -y
# # sudo pip3 install ansible  --user ansible

# ANISIBLE_INSTALLATION=/tmp/ansible_installation.log
# PYVER=$(python3 --version)


# ELV=$(rpm -q basesystem |sed -e 's/\./ /g' |xargs -n 1|grep ^el)
 
#  if [ $ELV != "el7" ] ; then 
#     echo -e "\e[31merror \e[0m OS Version not supported"
#      exit 1
   
#  fi 

# PRINT() {
#      echo -e  "\e[37m-------------------------------------------------------------"
#      echo -e  "\e[1;35m[INFO] :: $1 \e[0m"
#      echo -e  "\e[37m-------------------------------------------------------------"
# }

# STAT() {

# if [ $1 -ne 0 ] ; then
#     echo -e "\e[1;32m[INFO] :: $2..IS \e[1;32mFAILED\e[0m"
#   else
#     echo -e "\e[1;32m[INFO] :: $2..IS \e[1;36mSUCCESS\e[0m"
# fi

# }

# PYTHON3() {
#     $PYVER >/dev/null

#     if [ $? -ne 0 ]; then
#         sudo yum install python3 &>>$ANISIBLE_INSTALLATION
#         else
#         echo "$(python3 --version) Is Installed Nothing to Do" 
#     fi 
# }

# PRINT "DOWNLOADING...get-pip.py"
#   GETPIPPY=./get-pip.py 
#   PRINT "To manually install pip, securely 1 download get-pip.py"
#   [[ -e $GETPIPPY ]] ||  curl -s  https://bootstrap.pypa.io/get-pip.py -o get-pip.py  &>>$ANISIBLE_INSTALLATION
# STAT $? "DOWNLOADING...get-pip.py"

# PRINT "Installing Python3*"
#   PYTHON3  &>>$ANISIBLE_INSTALLATION
# STAT $? "Installing $PYVER"

# PRINT  "Installing python get-pip"
#   python3 get-pip.py  &>>$ANISIBLE_INSTALLATION
# STAT $? "Installing python get-pip"

# PRINT "Installing Ansible"
#   pip install ansible  &>>$ANISIBLE_INSTALLATION
# STAT $? "installing Ansible"
# ansible --version
