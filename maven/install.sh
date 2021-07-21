#!/bin/bash
LID=$(id -u)
if [ $LID -ne 0 ] ;then
    echo -e "\e"
