#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
"$SCRIPTS_ROOT/openssl/generate-https-cert.sh" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
echo "$script: Finished."
