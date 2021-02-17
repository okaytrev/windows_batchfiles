REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableTcpChargen /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableUdpChargen /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableTcpQotd /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableUdpQotd /t reg_dword /d 0 /f

net stop simptcp

net start simptcp

netsh advfirewall set allprofiles state on

REM Add firewall rules.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="VLC" dir=out action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="VLC" dir=in action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="Content Player" dir=out action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"
netsh advfirewall firewall add rule name="Content Player" dir=in action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"

REM Add firewall rules for Local fileshare.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=TCP localport=139,445
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=UDP localport=139,445

xcopy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Four Winds Interactive\Content Player.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"

cmd /c SCHTASKS.EXE /delete /TN "fwi reboot" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-restart" /f
cmd /c SCHTASKS.EXE /delete /TN "fwi-nightly" /f
cmd /c SCHTASKS.EXE /CREATE /SC DAILY /TN "FWI reboot" /ST 02:30:00 /SD 01/01/2000 /TR "c:\windows\system32\shutdown.exe -r -f -t 10" /RU SYSTEM

