#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
root=root
certpurpose=$root
password=$root-password
subject="/C=US/CN=Dev-Root-CA"
mkdir -p "$PROJECT_ROOT/devcerts/$certpurpose"
openssl req -x509 -nodes -new -sha256 -days 3650 -newkey rsa:2048 -keyout "$PROJECT_ROOT/devcerts/$certpurpose/cert.key" -out "$PROJECT_ROOT/devcerts/$certpurpose/cert.pem" -subj $subject
openssl x509 -outform pem -in "$PROJECT_ROOT/devcerts/$certpurpose/cert.pem" -out "$PROJECT_ROOT/devcerts/$certpurpose/cert.crt"
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout pass:$password -inkey "$PROJECT_ROOT/devcerts/$certpurpose/cert.key" -in "$PROJECT_ROOT/devcerts/$certpurpose/cert.crt" -export -out "$PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
git add -f "$PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
echo "$script: Finished."
