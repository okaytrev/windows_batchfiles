netsh advfirewall set allprofiles state on

REM Add firewall rules.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="VLC" dir=out action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="VLC" dir=in action=allow profile=any description="VLC" program="C:\Program Files\VideoLAN\VLC\vlc.exe"
netsh advfirewall firewall add rule name="Content Player" dir=out action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"
netsh advfirewall firewall add rule name="Content Player" dir=in action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"

REM Add firewall rules for Local fileshare.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=TCP localport=139,445
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=UDP localport=139,445