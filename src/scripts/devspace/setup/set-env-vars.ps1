$script = $PSCommandPath | Resolve-Path -Relative
# too noisy
# Write-Host "${script}: Starting."
try {
    # Do this everytime to ensure the environment is always up to date.
    if ($PSVersionTable.PSEdition -eq 'Core') {
        $pshell="pwsh"
    } else {
        $pshell="PowerShell"
    }

    $env:PSHELL="$pshell"
    Set-Alias -Name "pshell" -Value "$pshell"
    if ($env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE -eq "true") {
        # Environment setup already complete.
        # Don't log this it would be too noisy.
        exit 0
    }

    Import-Module Set-PsEnv
    $env:KINDEST_ARGO_CD_PROJECT_ROOT=$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent)
    Write-Host "${script}: KINDEST_ARGO_CD_PROJECT_ROOT=$env:KINDEST_ARGO_CD_PROJECT_ROOT"
    Push-Location $env:KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer
    Set-PsEnv
    Pop-Location
    Write-Host "${script}: Environment variables set."
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    # too noisy
    # Write-Host "${script}: Finished."
}
