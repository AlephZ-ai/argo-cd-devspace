#!/usr/bin/env bash
echo "argo/forward-ports.sh: Starting."
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
./src/scripts/argo/wait-for-argo-server.sh
existingForward=$(lsof -i "tcp:$KINDEST_ARGO_CD_ARGO_PORT")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
    # echo "Forward already exists. Killing."
    # pkill kubectl -9
fi
kubectl port-forward svc/argocd-server "$KINDEST_ARGO_CD_ARGO_PORT":443
echo "argo/forward-ports.sh: Finished."
