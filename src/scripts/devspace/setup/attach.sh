#!/usr/bin/env bash
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/configure-credential-manager.sh"
gh auth login --with-token <<< "$GITHUB_TOKEN"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/forward-port-continuously.sh"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/login.sh"
