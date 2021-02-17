cmd /c SCHTASKS.EXE /delete /TN "Reboot" /f
cmd /c SCHTASKS.EXE /CREATE /SC DAILY /TN "FWI reboot" /ST 02:30:00 /SD 01/01/2000 /TR "c:\windows\system32\shutdown.exe -f -t 10" /RU SYSTEM