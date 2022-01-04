# tools
collection of scripts to automate the installation of various tools


#   Utilities
#   Utilities
#   Utilities
#   Utilities

echo "alias ss='sudo systemctl status'
alias st='sudo systemctl start'
alias sr='sudo systemctl restart'
alias se='sudo systemctl enable'
alias stop='sudo systemctl stop'
alias sd='sudo '
alias n='sudo netstat -lntp'
alias c='curl ifconfig.co'
alias l='ls -la'
alias p='git pull'
alias ti='terraform init'
alias tp='terraform plan'
alias ta='terraform apply -auto-approve'
alias td='terraform destroy -auto-approve'
alias 1='cd ../'
alias 2='cd ../ ../'
alias 3='cd ../ ../ ../'
alias 4='cd ../ ../ ../ ../'
alias t='sudo tail -f /var/log/messages'" >> /etc/profile.d/my_auto_script.sh && su -
mkdir -R /home/centos/.ssh/
cp -u ~/.ssh/??* /home/centos/.ssh/
chown -R centos:centos /home/centos/.ssh/
git -C /home/centos/  clone git@ssh.dev.azure.com:v3/sudheerlikeu/D54/shell-scripting
su - centos
cd /home/centos/