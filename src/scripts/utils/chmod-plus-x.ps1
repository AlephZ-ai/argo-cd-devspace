git add .
Get-ChildItem -Recurse -Path "$PROJECT_ROOT" -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
