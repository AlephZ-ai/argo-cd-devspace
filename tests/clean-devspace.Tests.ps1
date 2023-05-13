BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe "clean-devspace.ps1" {
    It "Given no parameters, it should clean the devspace without errors" {
        # Arrange
        $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
        $scriptPath = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "clean-devspace.ps1"

        # Act
        $result = { & $scriptPath }

        # Assert
        $result | Should -Not -Throw
    }
}
