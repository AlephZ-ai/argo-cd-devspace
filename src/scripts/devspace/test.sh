#!/usr/bin/env bash
./src/scripts/utils/chmod-plus-x.sh
./src/scripts/devspace/build.sh
containerid=$(docker ps -q -f name=kindest-argo-cd-devspace)
devcontainer exec --container-id "$containerid" argocd version --short
./src/scripts/devspace/clean.sh
