git add "$env:KINDEST_ARGO_CD_PROJECT_ROOT"
git update-index --chmod=+x run
Get-ChildItem -Recurse -Path "$env:KINDEST_ARGO_CD_PROJECT_ROOT" -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
