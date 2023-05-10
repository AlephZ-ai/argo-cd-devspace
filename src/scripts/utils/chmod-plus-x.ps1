git add .
Get-ChildItem -Recurse -Filter "*.sh" | git update-index --chmod=+x
