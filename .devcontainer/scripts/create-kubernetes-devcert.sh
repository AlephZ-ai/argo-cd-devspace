#!/bin/sh
# TODO: Make sure this script is idempotent since it will be run multiple times
local namespace=$1
local certpurpose=$2
local certpass=$3
~/scripts/generate-devcert.sh $certpurpose $certpass
kubectl create -n $namespace secret tls $certpurpose \
  --cert=.devcontainer/devcerts/$certpurpose/cert.pem \
  --key=.devcontainer/devcerts/$certpurpose-tls/key.pem
