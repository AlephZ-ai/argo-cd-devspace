$i="$PSCommandPath"
Write-Host "${i}: Starting up devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
devcontainer up --workspace-folder "$env:KINDEST_ARGO_CD_PROJECT_ROOT"
Write-Host "${i}: Finished starting up devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
