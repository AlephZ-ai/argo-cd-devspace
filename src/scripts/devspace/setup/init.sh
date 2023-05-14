#!/usr/bin/env bash
gh auth login --with-token <<< "$GITHUB_TOKEN"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/configure-credential-manager.sh"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/self-manage.sh"
