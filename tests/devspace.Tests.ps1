BeforeAll {
    $test = $PSCommandPath | Resolve-Path -Relative
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
    Write-Host "${test}: Starting."
}

AfterAll {
    Write-Host "${test}: Finished."
}

Describe "<command>"-ForEach @(
    @{ name = "generate-devcerts"; command = "generate"; area = "devcerts" }
    @{ name = "utils-chmod-plus-x"; command = "chmod-plus-x"; area = "utils" }
    @{ name = "clean-devspace"; command = "clean"; area = "devspace" }
    @{ name = "build-devspace"; command = "build"; area = "devspace" }
    @{ name = "up-devspace"; command = "up"; area = "devspace" }
) {
    It "Given the following command(name=$name, command=$command, area=$area), run it without errors" {
        # Arrange
        $commandsPath = Join-Path -Path ($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent) -ChildPath "commands"
        $areaPath = Join-Path -Path $commandsPath -ChildPath "$area"
        $command = Join-Path -Path $areaPath -ChildPath "$command.ps1"

        # Act
        $result = { & $command }

        # Assert
        $result | Should -Not -Throw
    }
}
