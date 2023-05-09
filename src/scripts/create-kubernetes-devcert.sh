#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
namespace=$1
certpurpose=$2
echo $certpurpose
kubectl create -n $namespace secret tls $certpurpose \
  --cert=devcerts/$certpurpose/cert.crt \
  --key=devcerts/$certpurpose/cert.key
