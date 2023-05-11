#!/usr/bin/env bash
existingForward=$(ps -ef | grep port-forward | grep "$$KINDEST_ARGO_CD_ARGO_PORT")
if [ -n "$existingForward" ]; then
    echo "Forward already exists. Skipping."
    return 0
fi
while ./src/scripts/argo/forward-ports.sh; do sleep 5s; done
