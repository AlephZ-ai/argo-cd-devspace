#!/usr/bin/env bash
script=$0
killExistingForwardIfExists=$4-false
echo "$script: Starting."
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
./src/scripts/argocd/wait-for-server.sh
./src/scripts/k8s/forward-service-port.sh "svc/$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$script: Finished."
