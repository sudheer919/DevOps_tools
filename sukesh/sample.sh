#!/bin/bash

LID=lt-07a997b45f50e990a
LVER=1
COMPONENT=$1

if [ -z ${COMPONENT} ] ;then
    echo "Provide Instance Name"
    exit   1
fi

PR_IP=$(aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications 'ResourceType=spot-instances-request,Tags=[{Key=Name,Value=${COMPONENT}]' 'ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}]'|jq .Instances[].PrivateIpAddress)

echo $PR_IP

