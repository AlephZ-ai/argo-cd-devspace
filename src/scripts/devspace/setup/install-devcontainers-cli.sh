#!/usr/bin/env bash
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/npm/install.sh" @devcontainers/cli
echo "$script: Finished."
