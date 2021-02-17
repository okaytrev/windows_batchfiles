REM import wireless profile. This happens every boot.
netsh wlan add profile filename="FWIWIFI.xml" user=all
netsh wlan connect name="FWIWIFI"

:10
REM Sync time with third party app. This runs every boot. TimezoneChanger also has time sync.
cmdtime3.exe sync /P /M:999999999

REM uninstall LMI mirror driver. This happens every boot.
"C:\Program Files (x86)\LogMeIn\x64\logmein.exe" uninstallmirrordrv

rem Licenses the Player. This happens every boot.
"C:\Program Files (x86)\Four Winds Interactive\Content Player\Signage.exe" /licenseKey=X7UE3-BTADV-R7PJ9-C8W78-ATZW5-9

REM set hostname as Player ID. This happens every boot.
cscript HostnameAsPlayerID-5.0.vbs

:20
REM checks existence of Labtech and will proceed with installation if absent. Otherwise will skip to next section.
IF EXIST "C:\Windows\LTSvc\" (GOTO 30) ELSE (GOTO ignitelt)

:IGNITELT
REM actual Labtech Installation line.
msiexec /i FWI_Agent_Install.MSI /qn

:30
REM Checks for existence of LogMeIn and will proceed with installation if absent. Otherwise, it will skip to the next section.
IF EXIST "C:\Program Files (x86)\LogMeIn\" (GOTO 50) ELSE (GOTO ignitelmi)

:IGNITELMI
REM Checks to see if the PC is online by pinging Google. If this fails, LogMeIn will not be installed this session. If successful, installation will begin.
ping www.google.com -n 1 -w 1000
if errorlevel 1 (GOTO 50) ELSE (GOTO 40)

:40
REM silent LogMeIn installation.
msiexec /i FWILogMeIn.msi /qn

:50
REM this simply runs the TimeZoneChanger utility to set system time.
cd "C:\Users\Public\Documents\Four Winds Interactive\Signage\Channels\(default)\"
TimeZoneChanger.exe

:END
exit