#!/usr/bin/env bash
i="$0"
echo "$i: Started initializing the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/configure-credential-manager.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/self-manage.sh"
echo "$i: Finished initializing the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
