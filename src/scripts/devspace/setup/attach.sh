#!/usr/bin/env zsh
#shellcheck shell=bash
# Stand cluster back up in background process
while ! kubefirst local create; do sleep 1s; done
kubefirst k3d root-credentials
kubectl get pods -A
