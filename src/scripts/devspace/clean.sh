containerid=$(docker ps -q -f name=kindest-argo-cd_devcontainer-kindest)
docker rm -f $containerid -f
docker container prune -f
docker image prune -a -f
docker network prune -f
docker volume prune -f
