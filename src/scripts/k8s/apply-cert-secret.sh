#!/usr/bin/env bash
certpurpose=$2
kubectl creaate secret tls "$certpurpose" \
  --cert="devcerts/$certpurpose/cert.crt" \
  --key="devcerts/$certpurpose/cert.key"
