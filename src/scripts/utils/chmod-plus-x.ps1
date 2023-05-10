git add .
Get-ChildItem -Recurse -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
