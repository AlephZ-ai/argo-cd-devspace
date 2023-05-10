#!/usr/bin/env bash
set -e
source <(kubectl completion zsh)
exec "$@"
