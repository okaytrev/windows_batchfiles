netsh advfirewall firewall add rule name="FWI Multicast" dir=in action=allow profile=any protocol=udp localport=5001,54001,54002,54003
netsh advfirewall firewall add rule name="FWI Multicast" dir=out action=allow profile=any protocol=udp localport=5001,54001,54002,54003