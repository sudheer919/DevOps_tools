#!/bin/bash

LID=lt-07a997b45f50e990a
LVER=1
COMPONENT=$1
HOSTED_ZONE_ID=Z09419003SDE5CZ2II0X0

if [ -z ${COMPONENT} ] ;then
    echo "Provide Instance Name"
    exit 0
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=$COMPONENT" | jq .Reservations[].Instances[].State.Name | grep running &>/dev/null
if [ $? -eq 0 ]; then
  echo "Instance $COMPONENT is already running"
  exit 0
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=$COMPONENT" | jq .Reservations[].Instances[].State.Name | grep stopped &>/dev/null
if [ $? -eq 0 ]; then
  echo "Instance $COMPONENT is already Created and In stopped state"
  exit 0
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=$COMPONENT" | jq .Reservations[].Instances[].State.Name | grep Pending &>/dev/null
if [ $? -eq 0 ]; then
  echo "Instance $COMPONENT is already Created and In Pending state"
  exit 0
fi

PR_IP=$(aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=${COMPONENT}}]" "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq .Instances[].PrivateIpAddress | sed -e 's/"/ /g' )




sed -e "s/COMPONENT_NAME/${COMPONENT}/" -e "s/IPADDRESS/${PR_IP}/" record.json >/tmp/record.json

aws route53 change-resource-record-sets --hosted-zone-id ${HOSTED_ZONE_ID} --change-batch file:///tmp/record.json

