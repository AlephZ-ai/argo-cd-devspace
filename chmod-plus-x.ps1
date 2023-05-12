git add .
git update-index --chmod=+x ./chmod-plus-x
git update-index --chmod=+x ./build-devspace
git update-index --chmod=+x ./clean-devspace
git update-index --chmod=+x ./test-devspace
git update-index --chmod=+x ./generate-devcerts
Get-ChildItem -Recurse -Path commands | ForEach-Object { git update-index --chmod=+x $_.FullName }
./src/scripts/utils/chmod-plus-x.ps1
