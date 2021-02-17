REM Change the workgroup to Signage
wmic computersystem where name="%computername%" call joindomainorworkgroup name="SIGNAGE"

REM Turn off the firewall
netsh advfirewall set privateprofile state on
netsh advfirewall set publicprofile state on
netsh advfirewall set domainprofile state on

REM Add firewall rules.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="VLC" dir=out action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="VLC" dir=in action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="Content Player" dir=out action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"
netsh advfirewall firewall add rule name="Content Player" dir=in action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"

netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM Enable Remote Desktop connections
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /d 0 /F /t REG_DWORD

REM Disable Simple TCP Services
sc config "simptcp" start= disabled
sc stop "simptcp"