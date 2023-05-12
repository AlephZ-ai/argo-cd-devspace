$commandPath = $PSCommandPath | Resolve-Path -Relative
Write-Host "${commandPath}: Starting."
try {
    git add .
    git update-index --chmod=+x "$PROJECT_ROOT/chmod-plus-x"
    git update-index --chmod=+x "$PROJECT_ROOT/build-devspace"
    git update-index --chmod=+x "$PROJECT_ROOT/clean-devspace"
    git update-index --chmod=+x "$PROJECT_ROOT/test-devspace"
    git update-index --chmod=+x "$PROJECT_ROOT/generate-devcerts"
    Get-ChildItem -Recurse -Path "$PROJECT_ROOT/commands" | ForEach-Object { git update-index --chmod=+x $_.FullName }
    "$SCRIPTS_ROOT/utils/chmod-plus-x.ps1"
} catch [System.Exception] {
    Write-Error "${commandPath}: Error: $_"
    exit 1
} finally {
   Write-Host "${commandPath}: Finished."
}
