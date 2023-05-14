#!/usr/bin/env bash
i=$0
echo "$i: Started generating certs"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/openssl/generate-root-ca.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/generate-devcerts.sh"
echo "$i: Finished generating certs"
