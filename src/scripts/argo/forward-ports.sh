#!/usr/bin/env bash
#shellcheck disable=SC2009
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
existingForward=$(ps -ef | grep port-forward | grep 17443)
if [ "$existingForward" != "" ]; then
    echo "Forward already exists. Exiting."
    exit 0
fi
(kubectl port-forward svc/argocd-server 17443:443 2>&1) &
sleep 1s
