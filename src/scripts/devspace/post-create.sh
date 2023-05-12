#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
echo "post-create.sh: Starting."
./src/scripts/argo/self-manage.sh
echo "post-create.sh: Finished."
