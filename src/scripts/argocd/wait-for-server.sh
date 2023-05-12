#!/usr/bin/env bash
script=$0
echo "$script: Starting."
./src/scripts/k8s/wait-for-service.sh "$KINDEST_ARGO_CD_ARGO_NAME-server"
echo "$script: Finished."
