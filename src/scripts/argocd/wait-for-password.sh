#!/usr/bin/env zsh
#shellcheck shell=bash
secret=argocd-initial-admin-secret
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/wait-for-secret.sh" "$secret"
