#!/usr/bin/env bash
echo "Waiting for $ARGONAME-server to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$ARGONAME-server" \
   --timeout=90s
