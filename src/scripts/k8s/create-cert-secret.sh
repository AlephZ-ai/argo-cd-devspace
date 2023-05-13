#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
certpurpose=$1
kubectl create secret tls "$certpurpose" \
  --cert="devcerts/$certpurpose/cert.crt" \
  --key="devcerts/$certpurpose/cert.key"
echo "$script: Finished."
