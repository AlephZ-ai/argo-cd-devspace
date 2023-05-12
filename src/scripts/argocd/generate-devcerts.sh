#!/usr/bin/env bash
script=$0
echo "$script: Starting."
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
echo "$script: Finished."
