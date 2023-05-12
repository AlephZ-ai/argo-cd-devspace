#!/usr/bin/env bash
script=$0
service=$1
echo "$script: Starting."
echo "Waiting for $service to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$service" \
   --timeout=90s
echo "$script: Finished."
