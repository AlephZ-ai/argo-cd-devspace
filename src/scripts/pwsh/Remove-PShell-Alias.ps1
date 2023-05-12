$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
    $SCRIPTS_ROOT = $commandPath | Resolve-Path -Parent -Abosulte
    "$SCRIPTS_ROOT/devspace/setup/set-env-vars.ps1"
    Remove-Alias -Name pshell
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
   Write-Host "${commandPath}: Finished."
}
