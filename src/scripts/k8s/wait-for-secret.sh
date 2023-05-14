#!/usr/bin/env bash
i="$0"
secret="$1"
retryDelay="$2-10s"
echo "$i: Started wiating for secret: $secret."
echo "Waiting for secret: $secret. CTRL-C to stop."
while ! (kubectl get secret "$secret" 2>/dev/null); do sleep "$retryDelay"; done
echo "$i: Finished waiting for secret: $secret."
