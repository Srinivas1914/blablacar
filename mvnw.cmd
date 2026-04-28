@REM Maven wrapper for Windows
@echo off
setlocal
set MAVEN_PROJECTBASEDIR=%~dp0
set MAVEN_WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.properties
for /f "tokens=2 delims==" %%i in ('findstr "distributionUrl" "%MAVEN_WRAPPER_PROPERTIES%"') do set DISTRIBUTION_URL=%%i
set MAVEN_USER_HOME=%USERPROFILE%\.m2
echo Using Maven wrapper - please run from Git Bash or WSL on Windows
