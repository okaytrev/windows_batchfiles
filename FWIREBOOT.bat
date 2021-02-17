cmd /c SCHTASKS.EXE /delete /TN "fwi reboot" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-nightly" /f
cmd /c SCHTASKS.EXE /CREATE /SC DAILY /TN "FWI reboot" /ST 03:00:00 /SD 01/01/2000 /TR "c:\windows\system32\shutdown.exe -f -t 10" /RU SYSTEM