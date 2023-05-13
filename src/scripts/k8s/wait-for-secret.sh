#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
secret=$1
echo "Waiting for secret: $secret password. CTRL-C to exit."
while ! (kubectl get secret "$secret" 2>&1); do sleep 10s; done
echo "$script: Finished."
