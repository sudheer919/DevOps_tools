#!/bin/bash 

# sudo yum remove ansible -y 
# rm -rf /usr/lib/python2.7/site-packages/ansible*
# sudo yum install python3 -y
# sudo pip3 install ansible  --user ansible


python3 --version

if [ $? -ne 0 ]; then
    sudo yum install python3 -y   &>>/dev/null
fi 

curl -s  https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo yum install -y python3*
python3 get-pip.py
pip install ansible
ansible --version

