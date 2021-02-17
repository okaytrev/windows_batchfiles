REM Allow PowerShell scripts to run
reg add HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v ExecutionPolicy /d Unrestricted /f

REM This script enables Autohide of the start menu
powershell -ExecutionPolicy Unrestricted -File "C:\Windows\setup\scripts\install.ps1"

CALL C:\Windows\Setup\Scripts\SetupFirewall.cmd

REM Disable WMP First Run Wizard
REG ADD HKLM\SOFTWARE\Microsoft\MediaPlayer\Preferences /F /V AcceptedEULA /T REG_DWORD /D 1
REG ADD HKLM\SOFTWARE\Microsoft\MediaPlayer\Preferences /F /V FirstTime /T REG_DWORD /D 1
REG ADD HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer /F /V GroupPrivacyAcceptance /T REG_DWORD /D 1

REM Cleanup things that might be left over from MDT
REM DEL /Y "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\*
REM DEL /Y "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\*.lnk

REM Allow connections from computers running any version of Remote Desktop (less secure)
reg add "hklm\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f

REM Java 7 Autoupdate
REG ADD "HKLM\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy" /V EnableJavaUpdate /T REG_DWORD /D 0 /F

REM Adobe Reader 11 Updater
REG ADD "HKLM\Software\Policies\Adobe\Acrobat Reader\11\FeatureLockDown" /V bUpdater /T REG_DWORD /D 00000000 /F

REM Cleanup
DEL /Y C:\Windows\System32\sysprep\*.xml

REM Run the user portion
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /f /v PostImage /t REG_SZ /d "C:\Windows\Setup\Scripts\Setupcomplete1.cmd"
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /f /v PostImage /t REG_SZ /d "C:\Windows\Setup\Scripts\Setupcomplete1.cmd" /reg:64
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v Setup /t REG_SZ /d "cmd.exe /C C:\Windows\Setup\Scripts\SetupComplete1.cmd" /f

CD "C:\FWI Tools"
CALL "C:\autologon\SetupAutologon.cmd"
timeout /t 5
DEL /Y "C:\autologon\SetupAutologon.cmd"