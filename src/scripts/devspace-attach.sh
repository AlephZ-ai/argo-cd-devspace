#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
./src/scripts/set-default-argo-password.sh
# keep port forwards alive don't shut down after the process ends.
tail -f /dev/null
