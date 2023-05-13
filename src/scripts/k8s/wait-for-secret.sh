#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
secret=$1
echo "Waiting for secret: $secret. CTRL-C to exit."
while ! (kubectl get secret "$secret" 2>&1); do sleep 10s; done
echo "$script: Finished."
