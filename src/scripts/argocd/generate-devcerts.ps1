# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring
$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
"$SCRIPTS_ROOT/pwsh/Set-PShell-Alias.ps1"
try {
    pshell -file "$SCRIPTS_ROOT/openssl/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
    pshell -file "$SCRIPTS_ROOT/openssl/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
    pshell -file "$SCRIPTS_ROOT/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
    "$SCRIPTS_ROOT/pwsh/Remove-PShell-Alias.ps1"
    Write-Host "${commandPath}: Finished."
}
