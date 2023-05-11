#!/usr/bin/env bash
# https://linuxhandbook.com/bash-arguments
# https://support.microfocus.com/kb/doc.php?id=7013103
# https://gist.github.com/cecilemuller/9492b848eb8fe46d462abeb26656c4f8
certpurpose=$1
password=$2
root=root
mkdir -p devcerts/$certpurpose
openssl req -new -nodes -newkey rsa:2048 -keyout devcerts/$certpurpose/cert.key -out devcerts/$certpurpose/cert.csr -subj "/C=US/ST=NC/L=Rolesville/O=$certpurpose/CN=localhost.local"
openssl x509 -req -sha256 -days 3650 -in devcerts/$certpurpose/cert.csr -CA devcerts/$root/cert.pem -CAkey devcerts/$root/cert.key -CAcreateserial -extfile devcerts/$root/domains.ext -out devcerts/$certpurpose/cert.crt
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout pass:$password -inkey devcerts/$certpurpose/cert.key -in devcerts/$certpurpose/cert.crt -export -out devcerts/$certpurpose/cert.pfx
git add -f devcerts/$certpurpose/cert.pfx
