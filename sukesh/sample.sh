#!/bin/bash

LID=lt-07a997b45f50e990a
LVER=1
COMPONENT=$1

if [ -z ${COMPONENT} ] ;then
    echo "Provide Instance Name"
    exit 1
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=catalogue" |jq .Reservations[].Instances[].State.Name | grep "running" | xargs &>/dev/null

if [ $? -eq 0 ] ; then
    echo "Already $COMPONENT is Exist"
    exit 2
fi


PR_IP=$(aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=${COMPONENT}}]" "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq .Instances[].PrivateIpAddress | sed -e 's/"/ /g' )

echo $PR_IP

