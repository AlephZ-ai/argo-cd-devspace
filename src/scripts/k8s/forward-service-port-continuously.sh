#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
existingForward=$(lsof -i "tcp:$hostPort")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    exit
fi
while ("$SCRIPTS_ROOT/k8s/forward-service-port.sh" "$service" "$hostPort" "$remotePort" "$killExistingForwardIfExists" || true); do sleep 1s; done &
sleep 1s
echo "$script: Finished."
