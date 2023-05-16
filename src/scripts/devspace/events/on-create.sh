#!/usr/bin/env zsh
#shellcheck shell=bash
rm -f nohup.out
rm -f gcm-diagnose.log
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/setup/setup.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
