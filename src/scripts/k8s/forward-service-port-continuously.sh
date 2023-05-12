#!/usr/bin/env bash
script=$0
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
echo "$script: Starting."
existingForward=$(lsof -i "tcp:$hostPort")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
fi
while ./src/scripts/k8s/forward-service-port.sh "$service" "$hostPort" "$remotePort" "$killExistingForwardIfExists"; do sleep 1s; done &
sleep 1s
echo "$script: Finished."
