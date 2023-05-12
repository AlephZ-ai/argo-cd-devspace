#!/usr/bin/env bash
script=$0
echo "$script: Starting."
devcontainer up --workspace-folder "$PROJECT_ROOT"
echo "$script: Finished."
