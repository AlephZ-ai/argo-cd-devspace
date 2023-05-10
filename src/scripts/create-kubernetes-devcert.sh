#!/usr/bin/env bash
namespace=$1
certpurpose=$2
echo $certpurpose
kubectl apply -n $namespace secret tls $certpurpose \
  --cert=devcerts/$certpurpose/cert.crt \
  --key=devcerts/$certpurpose/cert.key
