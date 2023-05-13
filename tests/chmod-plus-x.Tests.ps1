BeforeAll {
    $test = $PSCommandPath | Resolve-Path -Relative
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
    Write-Host "${test}: Starting."
}

AfterAll {
    Write-Host "${test}: Finished."
}

Describe "chmod-plus-x.<ext>"-ForEach @(
    @{ ext = "ps1" }
    @{ ext = "cmd" }
) {
    It "Given no parameters, it should chmod +x all .sh files in the project recursively without errors" {
        # Arrange
        $script = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "chmod-plus-x.$ext"

        # Act
        $result = { & $script }

        # Assert
        $result | Should -Not -Throw
    }
}
