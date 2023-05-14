#!/usr/bin/env bash
i="$0"
gcm=git-credential-manager
echo "$i: Started configuring $gcm."
$gcm configure
echo "$i: Finished configuring $gcm."
