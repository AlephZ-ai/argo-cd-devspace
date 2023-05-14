$i="$PSCommandPath"
Write-Host "${i}: Started building devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
devcontainer build --workspace-folder "$KINDEST_ARGO_CD_PROJECT_ROOT"
Write-Host "${i}: Finished building devspace: $KINDEST_ARGO_CD_PROJECT_ROOT."
