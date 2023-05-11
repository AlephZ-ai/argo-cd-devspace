#!/usr/bin/env bash
echo "Waiting for $ARGO_NAME-server to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$ARGO_NAME-server" \
   --timeout=90s
