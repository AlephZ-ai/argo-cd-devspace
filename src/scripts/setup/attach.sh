#!/usr/bin/env zsh
#shellcheck shell=bash
# Stand cluster back up in background process
k3d clusters start kubefirst
kubefirst k3d root-credentials
kubectl get pods -A
