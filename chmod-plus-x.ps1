$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)/src/scripts"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    git add "$env:KINDEST_ARGO_CD_PROJECT_ROOT"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/chmod-plus-x"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/build-devspace"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/clean-devspace"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/test-devspace"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/generate-devcerts"
    git update-index --chmod=+x "$env:KINDEST_ARGO_CD_PROJECT_ROOT/argo-version"
    & "$env:scriptsPath/utils/chmod-plus-x.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
