./src/scripts/openssl/generate-https-cert.ps1 "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
./src/scripts/openssl/generate-https-cert.ps1 "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
./src/scripts/openssl/generate-https-cert.ps1 "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
