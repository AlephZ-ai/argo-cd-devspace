$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)"
    & "$scriptsPath/src/scripts/devspace/setup/set-env-vars.ps1"
    & "$scriptsPath/devspace/clean.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
