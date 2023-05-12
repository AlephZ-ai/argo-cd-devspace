#!/usr/bin/env bash
script=$0
killExistingForwardIfExists=$4-false
echo "$script: Starting."
./src/scripts/k8s/forward-service-port-continuously.sh "svc/$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$script: Finished."
