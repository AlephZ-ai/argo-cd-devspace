#!/usr/bin/env zsh
#shellcheck shell=bash
# "$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/self-manage.sh"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/devspace/setup/set-env-vars.sh"
while ! (bash -c "kubefirst k3d create"); do echo "Retrying Create Kubefirst Cluster"; sleep 1s; done
