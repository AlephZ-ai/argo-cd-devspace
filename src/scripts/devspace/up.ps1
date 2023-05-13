$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    devcontainer up --workspace-folder "$env:KINDEST_ARGO_CD_PROJECT_ROOT"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
