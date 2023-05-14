#!/usr/bin/env bash
i="$0"
command="$1"
echo "$i: Started executing command: $command on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/up.sh"
containerid=$(docker ps -q -f name="$KINDEST_ARGO_CD_PROJECT_NAME-devspace")
devcontainer exec --container-id "$containerid" zsh -l -c "$KINDEST_ARGO_CD_PROJECT_ROOT/$command"
echo "$i: Finished executing command: $command on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
