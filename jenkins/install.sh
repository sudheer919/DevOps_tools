#!/bin/bash

#Downloding functions
curl -s https://raw.githubusercontent.com/sudheer919/DevOps_tools/main/functions/common_functions.sh -o /tmp/functions.sh

source /tmp/functions.sh
## Checking Root User or not.
CheckRoot

#Installing Jenkins
PrintHead "INSTALLING Jenkins"
false
Stat $?
