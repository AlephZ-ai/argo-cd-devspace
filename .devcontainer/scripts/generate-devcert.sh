#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
# https://linuxhandbook.com/bash-arguments
# https://support.microfocus.com/kb/doc.php?id=7013103
local certpurpose=$1
local password=$2
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout devcerts/$certpurpose/key.pem -out devcerts/$certpurpose/cert.pem
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout pass:$password -inkey devcerts/$certpurpose/key.pem -in devcerts/$certpurpose/cert.pem -export -out devcerts/$certpurpose/cert.pfx
