#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
killExistingForwardIfExists=$4-false
"$scriptsPath/k8s/forward-service-port-continuously.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$script: Finished."
