#!/usr/bin/env bash
service=$1
hostPort=$2
remotePort=$3
killExistingForwardIfExists=$4-false
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
needsForward="true"
existingForward=$(lsof -i "tcp:$hostPort")
if [ -n "$existingForward" ]; then
    if [ "$killExistingForwardIfExists" = "true" ]; then
        pkill kubectl -9
    else
        needsForward=false
    fi
fi
if [ "$needsForward" = "true" ]; then
    while ! (kubectl port-forward "svc/$service" "$hostPort:$remotePort"); do sleep 1s; done
fi
