#!/usr/bin/env zsh
#shellcheck shell=bash
#shellcheck disable=2016
rm -f nohup.out
while ! (bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"); do echo "Retrying Homebrew Install"; sleep 1s; done
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/mkcert/install.sh"
mkdir -p ~/.ssh/
touch ~/.ssh/known_hosts
export PATH=$PATH:~/.dotnet/tools
bash -c eval "$(ssh-keyscan github.com >> ~/.ssh/known_hosts)"
dotnet dev-certs https --trust
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/git/install-git-credential-manager.sh"
gh auth auth login
gh auth setup-git
# https://github.com/sigstore/gitsign/blob/main/cmd/gitsign-credential-cache/README.md
while (gh auth refresh); echo "\$GITHUB_TOKEN refreshed"; do echo "caching \$GITHUBTOKEN"; gitsign-credential-cache; done &
# TODO: Why does this break things?
# git config --global --add safe.directory /workspaces/$PROJECT
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/install-devcontainers-cli.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/npm/install.sh" "dotenv-cli"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install.sh" "Set-PsEnv"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/pwsh/install.sh" "Pester"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kubefirst/install.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/kubefirst/create.sh"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/kind/create-kindest-cluster.sh"
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/install.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/setup-zshrc.sh"
