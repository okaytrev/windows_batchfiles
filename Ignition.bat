:10
IF EXIST "C:\Program Files (x86)\Four Winds Interactive\" (GOTO 20) ELSE (GOTO ignitecp)

:IGNITECP
rem installs player
.\ContentPlayer.msi /q

rem Licenses the Player
"C:\Program Files (x86)\Four Winds Interactive\Content Player\Signage.exe" /licenseKey=X7UE3-BTADV-R7PJ9-C8W78-ATZW5-9

COPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Four Winds Interactive\Content Player.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Content Player.lnk"

cscript HostnameAsPlayerID-5.0.vbs

cscript PinCPandCPCtoStartMenu.vbs

"C:\Program Files (x86)\Four Winds Interactive\Content Player\Signage.exe"

:20
IF EXIST "C:\Windows\LTSvc\" (GOTO 30) ELSE (GOTO ignitelt)

:IGNITELT
msiexec /i FWI_Agent_Install.MSI /qn

:30
IF EXIST "C:\Program Files (x86)\LogMeIn\" (GOTO 40) ELSE (GOTO ignitelmi)

:IGNITELMI
msiexec /i FWILogMeIn.msi /qn

"C:\Program Files (x86)\LogMeIn\x64\logmein.exe" uninstallmirrordrv

:40


:END
exit