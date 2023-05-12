#!/usr/bin/env bash
script=$0
echo "$script: Starting."
src/scripts/devcerts/generate.sh "$KINDEST_ARGO_CD_ARGO_NAME-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls-password"
src/scripts/devcerts/generate.sh "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls-password"
src/scripts/devcerts/generate.sh "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls-password"
echo "$script: Finished."
