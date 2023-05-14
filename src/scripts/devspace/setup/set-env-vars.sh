#!/usr/bin/env bash
# shellcheck disable=SC1091
# shellcheck source=$KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer/.env
#!/usr/bin/env bash
i="$0"
projectRoot="$(dirname "$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE-$0}")" &> /dev/null && pwd)")")")")"
echo "$i: Started setting up environment variables."
export PSHELL="pwsh"
export KINDEST_ARGO_CD_PROJECT_ROOT="$projectRoot"
export KINDEST_ARGO_CD_COMMANDS_ROOT="$KINDEST_ARGO_CD_PROJECT_ROOT/commands"
export KINDEST_ARGO_CD_SOURCE_ROOT="$KINDEST_ARGO_CD_PROJECT_ROOT/src"
export KINDEST_ARGO_CD_SCRIPTS_ROOT="$KINDEST_ARGO_CD_SOURCE_ROOT/scripts"
set -o allexport
source "$KINDEST_ARGO_CD_PROJECT_ROOT/.devcontainer/.env"
set +o allexport
echo "$i: Set the environment variables."
echo "$i: Set KINDEST_ARGO_CD_PROJECT_ROOT=$KINDEST_ARGO_CD_PROJECT_ROOT"
echo "$i: Set KINDEST_ARGO_CD_COMMANDS_ROOT=$KINDEST_ARGO_CD_COMMANDS_ROOT"
echo "$i: Set KINDEST_ARGO_CD_SOURCE_ROOT=$KINDEST_ARGO_CD_SOURCE_ROOT"
echo "$i: Set KINDEST_ARGO_CD_SCRIPTS_ROOT=$KINDEST_ARGO_CD_SCRIPTS_ROOT"
echo "$i: Finished setting up environment variables."
