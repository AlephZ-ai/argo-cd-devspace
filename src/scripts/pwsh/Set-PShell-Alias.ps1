$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
    $SCRIPTS_ROOT = $commandPath | Resolve-Path -Parent -Abosulte
    "$SCRIPTS_ROOT/devspace/setup/set-env-vars.ps1"
    if ($PSVersionTable.PSEdition -eq 'Core') {
        Set-Alias -Name pshell -Value pwsh
    } else {
        Set-Alias -Name pshell -Value powershell
    }
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
   Write-Host "${commandPath}: Finished."
}
