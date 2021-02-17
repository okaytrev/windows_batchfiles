cmd /c SCHTASKS.EXE /delete /TN "reboot" /f
cmd /c SCHTASKS.EXE /delete /TN "FWI reboot" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-nightly" /f
SCHTASKS.EXE /CREATE /F /SC minute /TN "FWI reboot" /ST $time5 /mo 5 /SD 01/01/2000 /TR  "c:\windows\system32\shutdown.exe -r -f -t 10" /RU SYSTEM