#!/usr/bin/env bash
i="$0"
echo "$i: Started building devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
devcontainer build --workspace-folder "$KINDEST_ARGO_CD_PROJECT_ROOT"
echo "$i: Finished building devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
