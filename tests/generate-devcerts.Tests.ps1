BeforeAll {
    $script = $PSCommandPath | Resolve-Path -Relative
    Write-Host "${script}: Starting."
}

AfterAll {
    Write-Host "${script}: Finished."
}

Describe 'generate-devcerts' {
    It 'Given no parameters, it should generate rood and argo cd devcerts without errors' {
        [Scriptblock]::Create("$($PSCommandPath | Resolve-Path -Relative:$false | Split-Path -Parent | Split-Path -Parent)/generate-devcerts.ps1") | Should -Not -Throw
    }
}
