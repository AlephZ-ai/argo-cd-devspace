#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
service=$1
echo "Waiting for $service to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector="app.kubernetes.io/name=$service" \
   --timeout=90s
echo "$script: Finished."
