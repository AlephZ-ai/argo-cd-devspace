$i = $PSCommandPath | Resolve-Path -Relative:$false
BeforeAll {
    $env:KINDEST_ARGO_CD_ENV_VARS_SETUP_COMPLETE=$false
    Write-Host "${i}: Starting Testing."
}

AfterAll {
    Write-Host "${i}: Finished Testing."
}

Describe "<script>"-ForEach @(
    @{ name = "generate-devcerts";                   script = "generate";     area = "devcerts" }
    @{ name = "utils-chmod-plus-x";                  script = "chmod-plus-x"; area = "utils" }
    @{ name = "clean-devspace";                      script = "clean";        area = "devspace" }
    @{ name = "build-devspace";                      script = "build";        area = "devspace" }
    @{ name = "up-devspace";                         script = "up";           area = "devspace" }
    @{ name = "exec-devspace argocd version";        script = "exec";         area = "devspace"; command = "argocd/version" }
) {
    It "Given the following run(name=$name, script=$script, area=$area, command=$command), make sure it completes without errors for ext <ext>" -ForEach @(
        @{ ext = "ps1" }
        # Need to detect when on Windows and only run the following tests if so
        # @{ cmd = "cmd" }
    ) {
        # Arrange
        $projectRoot = "$($PSScriptRoot | Resolve-Path -Relative:$false | Split-Path -Parent)"

        # Act
        if ($command -eq $null) {
            $result = { & "$projectRoot/run.$ext" "$area/$script" }
        } else {
            $result = { & "$projectRoot/run.$ext" "$area/$script" "$command" }
        }

        # Assert
        $result | Should -Not -Throw
    }
}
