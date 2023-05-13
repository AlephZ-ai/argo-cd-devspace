$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
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

    Import-Module Dotenv
    $PROJECT_ROOT=$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent)
    Set-DotEnv -Path "$PROJECT_ROOT\.devcontainer\.env"
    Write-Host "${script}: Environment variables set."
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    Write-Host "${script}: Finished."
}
