$i="$PSCommandPath"
Write-Host "${i}: Started cleaning devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
for($j=1; $j -le 5; $j++) {
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
Write-Host "${i}: Finished cleaning devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
