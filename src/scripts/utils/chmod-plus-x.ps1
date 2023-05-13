$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    git add "$env:KINDEST_ARGO_CD_PROJECT_ROOT"
    Get-ChildItem -Recurse -Path "$env:KINDEST_ARGO_CD_PROJECT_ROOT" -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
    Get-ChildItem -Recurse -Path "$env:KINDEST_ARGO_CD_PROJECT_ROOT/commands" -Filter "*" | ForEach-Object { git update-index --chmod=+x $_.FullName }
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
