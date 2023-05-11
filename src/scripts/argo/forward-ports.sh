#!/usr/bin/env bash
#shellcheck disable=SC2009
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
./src/scripts/argo/wait-for-argo-server.sh
existingForward=$(ps -ef | grep port-forward | grep 17443)
if [ "$existingForward" != "" ]; then
    echo "Forward already exists. Skipping."
    return 0
    # echo "Forward already exists. Killing."
    # pkill kubectl -9
fi
(kubectl port-forward svc/argocd-server 17443:443 2>&1) &
sleep 1s
