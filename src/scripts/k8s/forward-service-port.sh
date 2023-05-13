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
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
existingForward=$(lsof -i "tcp:$hostPort")
needsForward="true"
if [ -z "$existingForward" ]; then
    if [ "$killExistingForwardIfExists" = "true" ]; then
        echo "Forward already exists. Killing."
        pkill kubectl -9
    else
        echo "Forward already exists. Skipping."
        needsForward=false
    fi
fi
if [ "$needsForward" = "true" ]; then
    echo "Attempting to forward $service to localhost:$hostPort..."
    while ! (kubectl port-forward "svc/$service" "$hostPort:$remotePort"); do echo "Retrying to forward $service to localhost:$hostPort..."; sleep 1s; done
    echo "$service sucessfully forwarded to localhost:$hostPort"
fi
echo "$script: Finished."
