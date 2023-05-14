#!/usr/bin/env bash
i="$0"
echo "$i: Started generating Argo CD devcerts."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.sh" \
    "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" \
    "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
echo "$i: Finished generating Argo CD devcerts."
