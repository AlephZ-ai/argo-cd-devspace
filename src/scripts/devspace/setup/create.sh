#!/usr/bin/env bash
rm -f nohup.out
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/setup-zshrc.sh"
echo "GITHUB_TOKEN=$GITHUB_TOKEN"
export GITHUB_TOKEN=$ALEPHZ_AI_ADMIN_GITHUB_TOKEN
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
while ! (bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"); do echo "Retrying Homebrew Install"; sleep 1s; done
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/mkcert/install.sh"
# TODO: Why does this break things?
# git config --global --add safe.directory /workspaces/$PROJECT
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/install-devcontainers-cli.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kubefirst/install.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/install-git-credential-manager.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/npm/install.sh" "dotenv-cli"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install.sh" "Set-PsEnv"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install.sh" "Pester"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/kind/create-kindest-cluster.sh"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/install.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kubefirst/create.sh"
