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

    $env:PROJECT="kindest-argo-cd"
    $env:PROJECT_ROOT="/workspaces/$env:PROJECT"
    $env:SCRIPTS_ROOT="$env:PROJECT_ROOT/src/scripts"
    $env:KINDEST_ARGO_CD_REPO_URL="https://github.com/AlephZ-ai/$env:PROJECT.git"
    $env:KINDEST_ARGO_CD_CLUSTER_NAME="kindest"
    $env:KINDEST_ARGO_CD_KUBE_PORT="10443"
    $env:KINDEST_ARGO_CD_ARGO_PORT="11443"
    $env:KINDEST_ARGO_CD_ARGO_PASSWORD="password"
    $env:KINDEST_ARGO_CD_ARGO_NAME="argocd"
    $env:KINDEST_ARGO_CD_ARGO_NAMESPACE="$KINDEST_ARGO_CD_ARGO_NAME"
    $env:KINDEST_ARGO_CD_ARGO_PROJECT="default"
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE="true"
    Write-Host "${script}: Environment variables set."
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    Write-Host "${script}: Finished."
}
