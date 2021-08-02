#!/bin/bash

curl -s https://raw.githubusercontent.com/sudheermuthyala/DevOps_tools/main/functions/common_functions.sh -o /tmp/functions.sh

.  /tmp/functions.sh



PrintHead "Checking SElinux"
SEstatus=$(sestatus | grep "SELinux status" | awk '{print $NF}' )
echo
if [ ${SEstatus} == "enabled"] ; then
    echo  "SELinux is :: ${SEstatus}"
    echo  "Disabling SELINUX.."
    sed -i -e '/^SELINUX/ c SELINUX=disabled' /etc/selinux/config
    Stat $? "Disabling Selinux is ::  ${2}"
else
    echo  "Already Selinux is ${SEstatus}"
fi