# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring
$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
$SCRIPTS_ROOT = $commandPath | Resolve-Path -Parent -Abosulte
"$SCRIPTS_ROOT/devspace/setup/set-env-vars.ps1"
try {
    pshell -file "$SCRIPTS_ROOT/openssl/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
    pshell -file "$SCRIPTS_ROOT/openssl/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
    pshell -file "$SCRIPTS_ROOT/generate-https-cert.ps1" -certpurpose (ConvertTo-SecureString -String -AsPlainText -Force "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls") -password "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
    Write-Host "${commandPath}: Finished."
}
