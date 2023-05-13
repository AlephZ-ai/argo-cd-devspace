@ECHO OFF
setlocal
set script=%0
set scriptFolder=%~dp0
echo "%script%: Starting."
set PROJECT_ROOT="%scriptFolder%"
set SCRIPTS_ROOT="%PROJECT_ROOT%/src/scripts"
git add "%PROJECT_ROOT%"
git update-index --chmod=+x "%PROJECT_ROOT%/chmod-plus-x"
git update-index --chmod=+x "%PROJECT_ROOT%/build-devspace"
git update-index --chmod=+x "%PROJECT_ROOT%/clean-devspace"
git update-index --chmod=+x "%PROJECT_ROOT%/test-devspace"
git update-index --chmod=+x "%PROJECT_ROOT%/generate-devcerts"
for /f "usebackq delims=|" %%f in (`dir /b "%PROJECT_ROOT%/commands"`) do echo %%f
pshell -file "$%SCRIPTS_ROOT%/utils/chmod-plus-x.ps1"
echo "%script%: Finished."
endlocal
