#!/usr/bin/env bash
echo "argocd/forward-ports-continuously.sh: Starting."
existingForward=$(lsof -i "tcp:$KINDEST_ARGO_CD_ARGO_PORT")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
fi
while ./src/scripts/argocd/forward-ports.sh; do sleep 1s; done &
sleep 1s
echo "argocd/forward-ports-continuously.sh: Finished."
