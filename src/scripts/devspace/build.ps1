$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    & "$($PSScriptRoot | Resolve-Path -Parent -Abosulte)/devspace/setup/set-env-vars.ps1"
    devcontainer build --workspace-folder "$env:PROJECT_ROOT"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
