#!/usr/bin/env bash
service="$1"
timeout="$2-90s"
echo "Waiting for service: $service. CTRL+C to stop."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$service" \
   --timeout="$timeout"
