#!/usr/bin/env bash
i="$0"
echo "$i: Started processing the on-create event on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
rm -f nohup.out
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/create.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$i: Finished processing the on-create event on devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
