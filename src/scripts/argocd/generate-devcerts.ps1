# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring
$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    & "$scriptsPath/openssl/generate-https-cert.ps1" -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-server-tls" -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-server-tls-password")
    & "$scriptsPath/openssl/generate-https-cert.ps1" -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password")
    & "$scriptsPath/openssl/generate-https-cert.ps1" -certpurpose "$env:KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" -password $(ConvertTo-SecureString -AsPlainText -Force -String "$env:KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password")
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    Write-Host "${script}: Finished."
}
