$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
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
