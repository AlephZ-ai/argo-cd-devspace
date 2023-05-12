#!/usr/bin/env bash
script=$0
echo "$script: Starting."
./src/scripts/utils/chmod-plus-x.sh
./src/scripts/devspace/up.sh
containerid=$(docker ps -q -f name=kindest-argo-cd-devspace)
devcontainer exec --container-id "$containerid" zsh -l -c "/workspaces/kindest-argo-cd/commands/argo-version"
./src/scripts/devspace/clean.sh
echo "$script: Finished."
