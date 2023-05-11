#!/usr/bin/env zsh
containerid=$(docker ps -q -f name=kindest-argo-cd_devcontainer-kindest)
if ! [ -z "$containerid" ]
then
    docker rm -f $containerid -f
fi
docker container prune -f
docker image prune -a -f
docker network prune -f
docker volume prune -f
