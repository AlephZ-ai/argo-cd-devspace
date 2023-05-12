#!/usr/bin/env bash
script=$0
echo "$script: Starting."
devcontainer build --workspace-folder .
echo "$script: Finished."
