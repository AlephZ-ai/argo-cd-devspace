$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $SCRIPTS_ROOT="$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)"; & "$SCRIPTS_ROOT/devspace/setup/set-env-vars.ps1"
    git add "$env:PROJECT_ROOT"
    Get-ChildItem -Recurse -Path "$env:PROJECT_ROOT" -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
