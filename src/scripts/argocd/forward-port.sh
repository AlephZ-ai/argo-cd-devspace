#!/usr/bin/env bash
killExistingForwardIfExists=$1-false
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/forward-service-port.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
