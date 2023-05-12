#!/usr/bin/env bash
script=$0
echo "$script: Starting."
"$SCRIPTS_ROOT/k8s/wait-for-service.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server"
echo "$script: Finished."
