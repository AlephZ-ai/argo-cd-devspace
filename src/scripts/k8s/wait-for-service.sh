#!/usr/bin/env bash
i="$0"
service="$1"
timeout="$2-90s"
echo "$i: Started wiating for service: $service."
echo "Waiting for service: $service. CTRL+C to stop."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$service" \
   --timeout="$timeout"
echo "$i: Finished waiting for service: $service."
