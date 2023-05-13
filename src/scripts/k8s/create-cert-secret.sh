#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
certpurpose=$1
kubectl create secret tls "$certpurpose" \
  --cert="devcerts/$certpurpose/cert.crt" \
  --key="devcerts/$certpurpose/cert.key"
echo "$script: Finished."
