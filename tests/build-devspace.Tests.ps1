BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)/src/scripts/devspace/setup/set-env-vars.ps1"
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe "build-devspace.ps1" {
    It "Given no parameters, build the devspace without errors" {
        # Arrange
        $scriptPath = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "build-devspace.ps1"

        # Act
        $result = { & $scriptPath }

        # Assert
        $result | Should -Not -Throw
    }
}
