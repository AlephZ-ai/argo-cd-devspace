#!/usr/bin/env bash
echo "argo/forward-ports-continuously.sh: Starting."
existingForward=$(lsof -i "tcp:$KINDEST_ARGO_CD_ARGO_PORT")
if [ -z "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
fi
while ./src/scripts/argo/forward-ports.sh; do sleep 1s; done &
sleep 1s
echo "argo/forward-ports-continuously.sh: Finished."
