$SCRIPTS_ROOT = $commandPath | Resolve-Path -Parent -Abosulte
"$SCRIPTS_ROOT/devspace/setup/set-env-vars.ps1"
git add "$PROJECT_ROOT"
Get-ChildItem -Recurse -Path "$PROJECT_ROOT" -Filter "*.sh" | ForEach-Object { git update-index --chmod=+x $_.FullName }
