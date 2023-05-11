#!/usr/bin/env bash
namespace=argocd
echo "Waiting for $namespace-server to be ready. CTRL-C to exit."
kubectl wait \
   --for=condition=ready pod \
   --selector=app.kubernetes.io/name=$namespace-server \
   --timeout=90s
