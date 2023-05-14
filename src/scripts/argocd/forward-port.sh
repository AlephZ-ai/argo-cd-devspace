#!/usr/bin/env bash
i="$0"
killExistingForwardIfExists=$1-false
echo "$i: Started forwarding Argo CD server port."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/forward-service-port.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server" "$KINDEST_ARGO_CD_ARGO_PORT" 443 "$killExistingForwardIfExists"
echo "$i: Finished forwarding Argo CD server port."
