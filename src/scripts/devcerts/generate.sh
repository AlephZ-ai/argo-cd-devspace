#!/usr/bin/env zsh
#shellcheck shell=bash
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-root-ca.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/generate-devcerts.sh"
