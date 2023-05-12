#!/usr/bin/env bash
script=$0
echo "$script: Starting."
"$SCRIPTS_ROOT/utils/chmod-plus-x.sh"
"SCRIPTS_ROOT/devspace/up.sh"
containerid=$(docker ps -q -f name=kindest-argo-cd-devspace)
devcontainer exec --container-id "$containerid" zsh -l -c "/workspaces/kindest-argo-cd/commands/argo-version"
"SCRIPTS_ROOT/devspace/clean.sh"
echo "$script: Finished."
