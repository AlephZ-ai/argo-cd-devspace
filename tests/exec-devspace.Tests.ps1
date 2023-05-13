BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe "exec-devspace.ps1" {
    It 'Given no parameters, it should exec without errors' {
        # Arrange
        $scriptPath = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "exec-devspace.ps1"

        # Act
        $result = { & $scriptPath }

        # Assert
        $result | Should -Not -Throw
    }
}
