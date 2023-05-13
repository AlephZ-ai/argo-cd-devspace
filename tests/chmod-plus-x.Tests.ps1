BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe 'chmod-plus-x' {
    It 'Given no parameters, it should chmod +x all .sh files in the project recursively without errors' {
        [Scriptblock]::Create("$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)/generate-devcerts.ps1") | Should -Not -Throw
    }
}
