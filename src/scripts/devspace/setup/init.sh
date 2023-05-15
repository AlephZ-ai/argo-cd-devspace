#!/usr/bin/env zsh
#shellcheck shell=bash
# Cleanup log from previous run
rm -f nohup.out
# GH login
if ! (gh auth status); then gh auth login; fi
# Cache gitsign credentials
while echo "gitsign credentials cached"; gitsign-credential-cache | true; do true; done &
export GITSIGN_CREDENTIAL_CACHE="$HOME/.cache/sigstore/gitsign/cache.sock"
# Run Kubefirst
while ! (bash -c "kubefirst local create "); do echo "Retrying Create Kubefirst Cluster"; sleep 1s; done
kubefirst k3d root-credentials
kubectl get pods -A
