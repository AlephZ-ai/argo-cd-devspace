#!/usr/bin/env bash
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/dotnet/install-tool.sh" git-credential-manager
eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
