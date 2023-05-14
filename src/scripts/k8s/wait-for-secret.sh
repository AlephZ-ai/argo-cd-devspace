#!/usr/bin/env bash
#shellcheck disable=SC2086
secret="$1"
echo "Waiting for secret: $secret. CTRL+C to stop."
while ! (kubectl get secret "$secret" > /dev/null 2>&1); do sleep 10s; done
