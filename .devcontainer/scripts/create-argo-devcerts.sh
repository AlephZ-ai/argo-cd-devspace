#!/usr/bin/env bash
local argocdNamespace="argocd"
~/.devcontainer/scripts/generate-devcert.sh $argocdNamespace-server-tls $argocdNamespace-server-tls-password
~/.devcontainer/scripts/generate-devcert.sh $argocdNamespace-repo-server-tls $argocdNamespace-repo-server-tls-password
~/.devcontainer/scripts/generate-devcert.sh $argocdNamespace-dex-server-tls $argocdNamespace-dex-server-tls-password
