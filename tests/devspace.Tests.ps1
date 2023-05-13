BeforeAll {
    $test = $PSCommandPath | Resolve-Path -Relative
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
    Write-Host "${test}: Starting."
}

AfterAll {
    Write-Host "${test}: Finished."
}

Describe "<command>"-ForEach @(
    @{ command = "generate-devcerts" }
    @{ command = "chmod-plus-x" }
    @{ command = "clean-devspace" }
    @{ command = "build-devspace" }
    @{ command = "up-devspace" }
) {
    It "Given the command $command, run it without errors" {
        # Arrange
        $script = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "$command.ps1"

        # Act
        $result = { & $script }

        # Assert
        $result | Should -Not -Throw
    }
}