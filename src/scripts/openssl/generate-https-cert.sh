#!/usr/bin/env bash
# https://linuxhandbook.com/bash-arguments
# https://support.microfocus.com/kb/doc.php?id=7013103
# https://gist.github.com/cecilemuller/9492b848eb8fe46d462abeb26656c4f8
certpurpose="$1"
password="$2"
root=root
mkdir -p "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose"
openssl req -new -nodes -newkey rsa:2048 \
    -keyout "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" \
    -out "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.csr" \
    -subj "/C=US/ST=NC/L=Rolesville/O=$certpurpose/CN=localhost.local"
openssl x509 -req -sha256 -days 3650 \
    -in "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.csr" \
    -CA "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/cert.pem" \
    -CAkey "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/cert.key" \
    -CAcreateserial -extfile "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/domains.ext" \
    -out "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt"
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout "pass:$password" \
    -inkey "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" \
    -in "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt" -export \
    -out "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
git add -f "$KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
