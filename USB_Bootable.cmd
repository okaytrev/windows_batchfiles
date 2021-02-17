@echo off
color 1a
:: BatchGotAdmin
:-------------------------------------
REM --add the following to the top of your bat file--

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Administrative Privileges are Required to run this program...
echo.
echo ------------------------
echo -  AUTOMATED BOOTABLE  -
echo ---  USB CREATOR     ---
echo.
echo ----   WRITTEN BY: -----
echo ------   TREVAR   ------
echo -------   HUPF   -------
echo.
echo ------  PROCEED  -------
echo -    WITH CAUTION!!!!  -
echo ------------------------
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

@echo off
REM Formats USB to become bootable
REM CAUTION IS ADVISED, last disk will be formatted
REM CREATED BY TREVAR HUPF - 5/26/2016


@echo off

color 1a
SET ThisScriptsDirectory=%~dp0

REM Allow PowerShell scripts to run
reg add HKLM\Software\Microsoft\PowerShell\ShellIds\Microsoft.PowerShell /v ExecutionPolicy /d Unrestricted /f

echo.
echo ------------------------
echo -  AUTOMATED BOOTABLE  -
echo ---  USB CREATOR     ---
echo.
echo ----   WRITTEN BY: -----
echo ------   TREVAR   ------
echo -------   HUPF   -------
echo.
echo ------  PROCEED  -------
echo -    WITH CAUTION!!!!  -
echo ------------------------


SET PowerShellScriptPath=%ThisScriptsDirectory%AutoDiskpart.ps1

Powershell.exe -executionpolicy bypass -command "& '%PowerShellScriptPath%'";

REM SET inst=%~dp0

REM Creates directorys in USB labeled W
REM MKDIR "W:\boot"
REM MKDIR "W:\EFI"
REM MKDIR "W:\reimage"
REM MKDIR "W:\sources"

REM Copies Content into target directorys
REM xcopy /H /I /C /Y /R /E "%inst%boot" "W:\boot"
REM xcopy /H /I /C /Y /R /E "%inst%EFI" "W:\EFI"
REM xCopy /H /I /C /Y /R /E "%inst%reimage" "W:\reimage"
REM xCOPY /H /I /C /Y /R /E "%int%sources" "W:\sources"

REM  Copies Boot files
REM COPY %inst%bootmgr W:\\
REM Copy %inst%bootmgr.efi W:\\



