$script = $PSCommandPath | Resolve-Path -Relative
Write-Host "${script}: Starting."
try {
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent)/src/scripts/devspace/setup/set-env-vars.ps1"
    git add "$env:PROJECT_ROOT"
    git update-index --chmod=+x "$env:PROJECT_ROOT/chmod-plus-x"
    git update-index --chmod=+x "$env:PROJECT_ROOT/build-devspace"
    git update-index --chmod=+x "$env:PROJECT_ROOT/clean-devspace"
    git update-index --chmod=+x "$env:PROJECT_ROOT/test-devspace"
    git update-index --chmod=+x "$env:PROJECT_ROOT/generate-devcerts"
    Get-ChildItem -Path "$env:PROJECT_ROOT/commands" | ForEach-Object { git update-index --chmod=+x $_.FullName }
    & "$env:SCRIPTS_ROOT/utils/chmod-plus-x.ps1"
} catch [System.Exception] {
    Write-Error "${script}: Error: $_"
    exit 1
} finally {
   Write-Host "${script}: Finished."
}
