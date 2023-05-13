#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/k8s/wait-for-service.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server"
echo "$script: Finished."
