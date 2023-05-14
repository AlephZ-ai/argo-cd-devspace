#!/usr/bin/env bash
i="$0"
secret="$1"
echo "$i: Started creating secret: $secret."
kubectl create secret tls "$secret" \
  --cert="devcerts/$secret/cert.crt" \
  --key="devcerts/$secret/cert.key"
echo "$i: Finished creating secret: $secret."
