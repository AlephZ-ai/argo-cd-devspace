#!/usr/bin/env zsh
#shellcheck shell=bash
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/dotnet/install-tool.sh" git-credential-manager
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/configure-credential-manager.sh"
