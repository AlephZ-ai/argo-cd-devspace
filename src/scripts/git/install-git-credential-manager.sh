#!/usr/bin/env bash
i="$0"
gcm=git-credential-manager
echo "$i: Started installing $gcm."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/dotnet/install-tool.sh" $gcm
echo "$i: Finished installing $gcm."
