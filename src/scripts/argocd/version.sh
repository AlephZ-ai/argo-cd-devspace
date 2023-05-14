#!/usr/bin/env bash
i="$0"
echo "$i: Started getting Argo CD version."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/wait-for-password.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/forward-port.sh" &
argocd version
echo "$i: Finished getting Argo CD version."
