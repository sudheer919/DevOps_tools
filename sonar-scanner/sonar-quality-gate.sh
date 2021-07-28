#!/bin/bash 
# This is Scrip is to check Sonar Quality Gates Status is "OK" or "ERROR"
USERNAME=$1
PASSWORD=$2
HOSTIP=$3
KEY=$4
STATUS=$(curl -s "$USERNAME:$PASSWORD" "http://${HOSTIP}:9000/api/qualitygates/project_status?projectKey=${KEY}" | jq  '.projectStatus.status' | xargs)

if [ "$STATES" == "OK" ]; then
  exit 0
 else
  exit 1
fi


# USERNAME=admin
# PASSWORD=sonar123
# HOSTIP=IPADDRESS
# KEY=cart (component_name)
