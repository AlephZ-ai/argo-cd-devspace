$i = $PSCommandPath | Resolve-Path -Relative:$false
BeforeAll {
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
    Write-Host "${i}: Starting Testing."
}

AfterAll {
    Write-Host "${i}: Finished Testing."
}

Describe "<script>"-ForEach @(
    # @{ name = "generate-devcerts";  script = "generate";     area = "devcerts" }
    # @{ name = "utils-chmod-plus-x"; script = "chmod-plus-x"; area = "utils" }
    @{ name = "clean-devspace";     script = "clean";        area = "devspace" }
    # @{ name = "build-devspace";     script = "build";        area = "devspace" }
    @{ name = "up-devspace";        script = "up";           area = "devspace" }
) {
    It "Given the following run(name=$name, script=$script, area=$area), make sure it completes without errors" {
        # Arrange
        $projectRoot = "$($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent)"

        # Act
        $result = { & "$projectRoot/run.ps1" -script "$area/$script" }

        # Assert
        $result | Should -Not -Throw
    }
}
