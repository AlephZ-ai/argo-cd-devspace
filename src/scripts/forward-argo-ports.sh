#!/usr/bin/env bash
# https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
kubectl port-forward svc/argocd-server -n argocd 7443:443 &
