BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
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
