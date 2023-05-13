#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
"$scriptsPath/k8s/wait-for-service.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server"
echo "$script: Finished."
