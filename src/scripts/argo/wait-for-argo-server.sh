#!/usr/bin/env bash
echo "Waiting for $KINDEST_ARGO_CD_ARGO_NAME-server to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$KINDEST_ARGO_CD_ARGO_NAME-server" \
   --timeout=90s
