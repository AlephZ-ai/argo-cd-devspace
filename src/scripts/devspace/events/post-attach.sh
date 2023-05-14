#!/usr/bin/env bash
i="$0"

echo "$i: Started processing the post-attach event for devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
rm -f nohup.out
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/set-env-vars.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/attach.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$i: Finished processing the post-attach event for devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
echo "$i: Am Sleeping Infinitly to keep kubectl forwarded ports alive."
sleep infinity
