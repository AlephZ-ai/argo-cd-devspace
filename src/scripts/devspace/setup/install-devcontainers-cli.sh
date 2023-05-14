#!/usr/bin/env bash
# https://docs.docker.com/engine/reference/builder/#cmd
# https://docs.npmjs.com/getting-started/
# https://www.npmjs.com/package/@devcontainers/cli
i="$0"
echo "$i: Started installing the DevContainer CLI."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/npm/install.sh" @devcontainers/cli
echo "$i: Finished installing the DevContainer CLI."
