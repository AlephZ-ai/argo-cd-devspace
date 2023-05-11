#!/usr/bin/env bash
#shellcheck disable=SC2009
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
./src/scripts/argo/wait-for-argo-server.sh
existingForward=$(ps -ef | grep port-forward | grep "$$KINDEST_ARGO_CD_ARGO_PORT")
if [ -n "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
    # echo "Forward already exists. Killing."
    # pkill kubectl -9
fi
kubectl port-forward svc/argocd-server "$KINDEST_ARGO_CD_ARGO_PORT":443
