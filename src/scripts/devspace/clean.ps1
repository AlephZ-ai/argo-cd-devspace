$containerid=$(docker ps -q -f name=kindest-argo-cd_devcontainer-kindest)
if ($containerid) {
    docker rm -f $containerid -f
}
$volumes = docker volume ls -q -f name=kindest-argo-cd
if ($volumes) {
    $volumes | ForEach-Object { docker volume rm $_ -f }
}
docker container prune -f
docker image prune -a -f
docker network prune -f
docker volume prune -f
