#!/usr/bin/env bash
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
script=$0
echo "$script: Starting."
"$SCRIPTS_ROOT/npm/install.sh" @devcontainers/cli
echo "$script: Finished."