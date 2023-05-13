#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
killExistingForwardIfExists=$4-false
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
# https://phoenixnap.com/kb/kubectl-port-forward
"$SCRIPTS_ROOT/argocd/wait-for-server.sh"
"$SCRIPTS_ROOT/k8s/forward-service-port.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$script: Finished."
