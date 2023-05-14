#!/usr/bin/env bash
i="$0"
echo "$i: Started waiting on Argo CD server."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/wait-for-service.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server"
echo "$i: Finished waiting on Argo CD server."
