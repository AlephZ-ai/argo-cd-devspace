#!/usr/bin/env bash
i="$0"
echo "$i: Started attaching to the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/forward-port-continuously.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/login.sh"
echo "$i: Finished attaching to the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
