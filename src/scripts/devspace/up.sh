#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
devcontainer up --workspace-folder "$PROJECT_ROOT"
echo "$script: Finished."
