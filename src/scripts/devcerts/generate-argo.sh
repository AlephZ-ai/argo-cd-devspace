#!/usr/bin/env bash
argocdNamespace="argocd"
src/scripts/devcerts/generate-devcert.sh $argocdNamespace-server-tls $argocdNamespace-server-tls-password
src/scripts/devcerts/generate-devcert.sh $argocdNamespace-repo-server-tls $argocdNamespace-repo-server-tls-password
src/scripts/devcerts/generate-devcert.sh $argocdNamespace-dex-server-tls $argocdNamespace-dex-server-tls-password
