#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
existingForward=$(lsof -i "tcp:$hostPort")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
fi
while ("$SCRIPTS_ROOT/k8s/forward-service-port.sh" "$service" "$hostPort" "$remotePort" "$killExistingForwardIfExists" || true); do sleep 1s; done &
sleep 1s
echo "$script: Finished."
