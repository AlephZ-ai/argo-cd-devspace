$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
    $env:POWERSHELL_SHELL=pwsh
    $env:KINDEST_ARGO_CD_REPO_URL=https://github.com/AlephZ-ai/kindest-argo-cd.git
    $env:KINDEST_ARGO_CD_CLUSTER_NAME=kindest
    $env:KINDEST_ARGO_CD_KUBE_PORT=10443
    $env:KINDEST_ARGO_CD_ARGO_PORT=11443
    $env:KINDEST_ARGO_CD_ARGO_PASSWORD=password
    $env:KINDEST_ARGO_CD_ARGO_NAME=argocd
    $env:KINDEST_ARGO_CD_ARGO_NAMESPACE=argocd
    $env:KINDEST_ARGO_CD_ARGO_PROJECT=default
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
    Write-Host "${commandPath}: Finished."
}
