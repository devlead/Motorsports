@echo off

CLS
ECHO.

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)
ECHO.
ECHO =====================================
ECHO Invoking UAC for Privilege Escalation
ECHO =====================================

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:gotPrivileges
setlocal & pushd .

set "DIR=%~dp0"
cd %~dp0
TITLE Motorsports -- Create IIS application
cd ./src/Build
Powershell.exe -File build.ps1 -Target CreateIISApplication -Verbosity Normal -SkipInstallDotNetCoreCli True
CHOICE /T 60 /C yYnN /CS /D y  /M "Should this window close? [Default y, you have 60 seconds]:"
if errorlevel 2 pause