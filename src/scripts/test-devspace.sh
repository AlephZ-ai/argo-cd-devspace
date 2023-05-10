#!/usr/bin/env zsh
devcontainer up --workspace-folder .
containerid=docker ps -q -f ancestor=cr.alephz.ai/devcontainers/kindest-argo-cd:latest
docker rm -f $containerid -f
docker container prune -f
docker image prune -a -f
docker network prune -f
docker volume prune -a -f
