#!/usr/bin/env bash
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
existingForward=$(lsof -i "tcp:$hostPort")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    exit
fi
while ("$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/forward-service-port.sh" "$service" "$hostPort" "$remotePort" "$killExistingForwardIfExists" || true); do sleep 1s; done &
