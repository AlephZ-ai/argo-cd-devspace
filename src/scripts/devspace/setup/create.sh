#!/usr/bin/env bash
i="$0"
echo "$i: Started creating the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
rm -f nohup.out
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/set-env-vars.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/setup-zshrc.sh"
# TODO: Why does this break things?
# git config --global --add safe.directory /workspaces/$PROJECT
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/install-devcontainers-cli.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/install-git-credential-manager.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/npm/install.sh" "dotenv-cli"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install-module.sh" "Set-PsEnv"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install-module.sh" "Pester"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kind/create-kindest-cluster.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/install.sh"
echo "$i: Finished creating the devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
