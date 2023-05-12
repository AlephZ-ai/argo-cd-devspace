#!/usr/bin/env bash
script=$0
certpurpose=$1
echo "$script: Starting."
kubectl creaate secret tls "$certpurpose" \
  --cert="devcerts/$certpurpose/cert.crt" \
  --key="devcerts/$certpurpose/cert.key"
echo "$script: Finished."
