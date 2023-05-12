#!/usr/bin/env bash
script=$0
root=root
certpurpose=$root
password=$root-password
subject="/C=US/CN=Dev-Root-CA"
echo "$script: Starting."
mkdir -p devcerts/$certpurpose
openssl req -x509 -nodes -new -sha256 -days 3650 -newkey rsa:2048 -keyout devcerts/$certpurpose/cert.key -out devcerts/$certpurpose/cert.pem -subj $subject
openssl x509 -outform pem -in devcerts/$certpurpose/cert.pem -out devcerts/$certpurpose/cert.crt
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout pass:$password -inkey devcerts/$certpurpose/cert.key -in devcerts/$certpurpose/cert.crt -export -out devcerts/$certpurpose/cert.pfx
git add -f devcerts/$certpurpose/cert.pfx
echo "$script: Finished."
