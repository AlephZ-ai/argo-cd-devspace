#!/usr/bin/env zsh
#shellcheck shell=bash
# Cleanup log from previous attach
rm -f nohup.out
# Stand cluster back up in background process
kubefirst local create
kubefirst k3d root-credentials
kubectl get pods -A
