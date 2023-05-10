#!/usr/bin/env bash
# TODO: Make sure this script is idempotent since it will be run multiple times
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
kubectl port-forward svc/argocd-server -n argocd 7443:443 &
