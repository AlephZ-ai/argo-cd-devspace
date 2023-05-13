$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    if ($PSVersionTable.PSEdition -eq 'Core') {
        $env:PSHELL="pwsh"
    } else {
        $env:PSHELL="PowerShell"
    }

    if ($env:KINDEST_ARGO_CD_ENV_SETUP_COMPLETE -eq "true") {
        # Environment setup already complete.
        # Don't log this it would be too noisy.
        exit 0
    }

    $env:PROJECT_ROOT="$($PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent | Resolve-Path -Relative:$false)"
    $env:SCRIPTS_ROOT="$env:PROJECT_ROOT/src/scripts"
    $env:KINDEST_ARGO_CD_REPO_URL="https://github.com/AlephZ-ai/kindest-argo-cd.git"
    $env:KINDEST_ARGO_CD_CLUSTER_NAME="kindest"
    $env:KINDEST_ARGO_CD_KUBE_PORT="10443"
    $env:KINDEST_ARGO_CD_ARGO_PORT="11443"
    $env:KINDEST_ARGO_CD_ARGO_PASSWORD="password"
    $env:KINDEST_ARGO_CD_ARGO_NAME="argocd"
    $env:KINDEST_ARGO_CD_ARGO_NAMESPACE="argocd"
    $env:KINDEST_ARGO_CD_ARGO_PROJECT="default"
    $env:KINDEST_ARGO_CD_ENV_SETUP_COMPLETE="true"
    
    Write-Host "${script}: Environment variables set."
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)/set-env-vars.cmd" $PSHELL
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
    Write-Host "${script}: Finished."
}
