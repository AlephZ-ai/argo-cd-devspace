#!/usr/bin/env zsh
#shellcheck shell=bash
rm -f nohup.out
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/create.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
