# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring
$i="$PSCommandPath"
Write-Host "${i}: Started generating Argo CD devcerts."
& "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.ps1" `
    -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-server-tls" `
    -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-server-tls-password")
& "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.ps1" `
    -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" `
    -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password")
& "$env:KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-https-cert.ps1" `
    -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" `
    -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password")
Write-Host "${i}: Finished generating Argo CD devcerts."
