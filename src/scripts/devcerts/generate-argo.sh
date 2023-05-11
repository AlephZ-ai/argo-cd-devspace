#!/usr/bin/env bash
argocdNamespace="argocd"
src/scripts/devcerts/generate.sh $argocdNamespace-server-tls $argocdNamespace-server-tls-password
src/scripts/devcerts/generate.sh $argocdNamespace-repo-server-tls $argocdNamespace-repo-server-tls-password
src/scripts/devcerts/generate.sh $argocdNamespace-dex-server-tls $argocdNamespace-dex-server-tls-password
