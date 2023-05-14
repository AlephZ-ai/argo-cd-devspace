#!/usr/bin/env bash
i="$0"
echo "$i: Starting up devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
devcontainer up --workspace-folder "$KINDEST_ARGO_CD_PROJECT_ROOT"
echo "$i: Finished starting up devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
