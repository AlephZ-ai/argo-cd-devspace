#!/usr/bin/env bash
# https://linuxhandbook.com/bash-arguments
# https://support.microfocus.com/kb/doc.php?id=7013103
# https://gist.github.com/cecilemuller/9492b848eb8fe46d462abeb26656c4f8
param (
    [Parameter(Mandatory=$true)]
    [string]$certpurpose,
    # https://social.technet.microsoft.com/wiki/contents/articles/4546.working-with-passwords-secure-strings-and-credentials-in-windows-powershell.aspx
    [Parameter(Mandatory=$true)]
    [securestring]$password
)

$i="$PSCommandPath"
$root="root"
Write-Host "${i}: Started generating HTTPS certificate for: ${certpurpose}."
if (!(Test-Path -Path "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose")) {
    New-Item -Force -ItemType File "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose"
}

openssl req -new -nodes -newkey rsa:2048 `
    -keyout "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" `
    -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.csr" `
    -subj "/C=US/ST=NC/L=Rolesville/O=$certpurpose/CN=localhost.local"
openssl x509 -req -sha256 -days 3650 `
    -in "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.csr" `
    -CA "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/cert.pem" `
    -CAkey "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/cert.key" `
    -CAcreateserial -extfile "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$root/domains.ext" `
    -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt"
# https://stackoverflow.com/questions/808669/convert-a-cert-pem-certificate-to-a-pfx-certificate
# https://stackoverflow.com/questions/63441247/how-to-pass-pkcs12-password-into-openssl-conversion-module
openssl pkcs12 -passout "pass:$password" `
    -inkey "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.key" `
    -in "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.crt" -export `
    -out "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
git add -f "$env:KINDEST_ARGO_CD_PROJECT_ROOT/devcerts/$certpurpose/cert.pfx"
Write-Host "${i}: Finished generating HTTPS certificate for: ${certpurpose}."
