#!/usr/bin/env bash
containerid=$(docker ps -q -f name=kindest-argo-cd_devcontainer)
if [ -n "$containerid" ]
then
    docker rm -f "$containerid"
fi
volumes=$(docker volume ls -q -f name=kindest-argo-cd_devcontainer)
if [ -n "$volumes" ]
then
    echo $volumes | xargs docker volume rm -f
fi
docker container prune -f
docker image prune -a -f
docker network prune -f
docker volume prune -f
