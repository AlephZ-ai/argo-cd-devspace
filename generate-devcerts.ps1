$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)/src/scripts/devspace/setup/set-env-vars.ps1"
    & "$env:SCRIPTS_ROOT/openssl/generate-root-ca.ps1"
    & "$env:SCRIPTS_ROOT/argocd/generate-devcerts.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}