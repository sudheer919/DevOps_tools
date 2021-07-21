#!/bin/bash
LID=$(id -u)
if [ $LID -ne 0 ] ;then
    echo -e "\e[31mYou need to be A root user "
