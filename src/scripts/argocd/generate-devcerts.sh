#!/usr/bin/env zsh
#shellcheck shell=bash
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
