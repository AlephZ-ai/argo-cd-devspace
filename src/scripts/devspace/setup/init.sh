#!/usr/bin/env zsh
#shellcheck shell=bash
# Run Kubefirst
kubefirst local create
kubefirst local root-credentials
kubectl get pods -A
