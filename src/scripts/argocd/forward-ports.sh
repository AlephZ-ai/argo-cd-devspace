#!/usr/bin/env bash
echo "argocd/forward-ports.sh: Starting."
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
./src/scripts/argocd/wait-for-server.sh
existingForward=$(lsof -i "tcp:$KINDEST_ARGO_CD_ARGO_PORT")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
    # echo "Forward already exists. Killing."
    # pkill kubectl -9
fi
kubectl port-forward svc/argocd-server "$KINDEST_ARGO_CD_ARGO_PORT":443
echo "argocd/forward-ports.sh: Finished."
