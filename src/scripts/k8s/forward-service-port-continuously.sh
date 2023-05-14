#!/usr/bin/env bash
i="$0"
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
echo "$i: Started forwarding host port: $hostPort continuously to service: $service."
existingForward=$(lsof -i "tcp:$hostPort")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    exit
fi
while ("$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/forward-service-port.sh" "$service" "$hostPort" "$remotePort" "$killExistingForwardIfExists" || true); do sleep 1s; done &
echo "$i: Finished forwarding host port: $hostPort continuously to service: $service."
