BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
    & "$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)/src/scripts/devspace/setup/set-env-vars.ps1"
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe "generate-devcerts.ps1" {
    It 'Given no parameters, it should generate devcerts recursively without errors' {
        # Arrange
        $scriptPath = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "generate-devcerts.ps1"

        # Act
        $result = { & $scriptPath }

        # Assert
        $result | Should -Not -Throw
    }
}
