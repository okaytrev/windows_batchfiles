netsh advfirewall firewall add rule name="FWI Multicast" dir=in action=allow profile=any protocol=udp localport=5555
netsh advfirewall firewall add rule name="FWI Multicast" dir=out action=allow profile=any protocol=udp localport=5555

netsh advfirewall firewall add rule name="FWI Content Player" dir=out action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"
netsh advfirewall firewall add rule name="FWI Content Player" dir=in action=allow profile=any description="Content Player Signage" program="C:\Program Files\Four Winds Interactive\Content Player\Signage.exe"

