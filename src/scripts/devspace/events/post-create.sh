#!/usr/bin/env bash
i="$0"
echo "$i: Started processing the post-create event on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/init.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$i: Finished processing the post-create event on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
