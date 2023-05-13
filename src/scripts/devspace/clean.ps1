$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    $scriptsPath = "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)"
    & "$scriptsPath/devspace/setup/set-env-vars.ps1"
    for($i=1; $i -le 3; $i++) {
        $containerid = docker ps -q -f name="$KINDEST_ARGO_CD_PROJECT_NAME-devspace"
        if ($containerid) {
            docker rm -f $containerid
        }
        $volumes = docker volume ls -q -f name="${KINDEST_ARGO_CD_PROJECT_NAME}_devcontainer"
        if ($volumes) {
            $volumes | ForEach-Object { docker volume rm -f $_ }
        }

        docker container prune -f
        docker image prune -a -f
        docker network prune -f
        docker volume prune -f
    }
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
