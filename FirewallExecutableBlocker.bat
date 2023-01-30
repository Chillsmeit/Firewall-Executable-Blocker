@echo off
title Chillsmeit Firewall Executable Blocker
mode con:cols=50 lines=6

REM Start of the AdminPrivilege checking code

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges

setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

REM END of the AdminPrivilege checking code

cls
color 04
echo    ::::::::::::::::::::::::::::::::::::::::::::
echo    ::         Adding Firewall Rules          ::
echo    ::              Please wait               ::
echo    ::           May take a while             ::
echo    ::::::::::::::::::::::::::::::::::::::::::::
timeout 1 >nul

REM Start of the Firewall Rules code

@ setlocal enableextensions 
@ cd /d "%~dp0"

for /R %%f in (*.exe) do (
  netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f" action=block >nul
  netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f" action=block >nul
)

REM End of the Firewall Rules code

cls
color 0A
echo    ::::::::::::::::::::::::::::::::::::::::::::
echo    ::             **Complete**               ::
echo    ::::::::::::::::::::::::::::::::::::::::::::
Pause
exit
