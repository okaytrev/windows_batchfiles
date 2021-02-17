netsh advfirewall set allprofiles state on

REM Add firewall rules for Local fileshare.  The image is set to use the "Work" profile by default
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=TCP localport=139,445
netsh advfirewall firewall add rule name="Allow TCP 139 and 445" dir=in action=allow remoteip=any protocol=UDP localport=139,445