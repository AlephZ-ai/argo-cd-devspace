#!/usr/bin/env bash
#shellcheck disable=SC2086
i="$0"
secret="$1"
echo "$i: Started wiating for secret: $secret."
echo "Waiting for secret: $secret. CTRL-C to stop."
while ! (kubectl get secret "$secret" 2> /dev/null); do sleep 10s; done
echo "$i: Finished waiting for secret: $secret."
