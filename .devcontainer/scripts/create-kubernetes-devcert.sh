#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
namespace=$1
certpurpose=$2
kubectl create -n $namespace secret tls $certpurpose \
  --cert=.devcontainer/devcerts/$certpurpose/cert.pem \
  --key=.devcontainer/devcerts/$certpurpose/key.pem
