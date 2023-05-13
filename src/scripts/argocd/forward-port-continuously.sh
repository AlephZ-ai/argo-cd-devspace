#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
killExistingForwardIfExists=$4-false
"$SCRIPTS_ROOT/k8s/forward-service-port-continuously.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$script: Finished."
