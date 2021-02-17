netsh interface ipv4 show interface

set /P LocalConnection="Enter the local area connection number: "

netsh interface ip delete dns "Local Area Connection %LocalConnection%" all
netsh interface ip set address "Local Area Connection %LocalConnection%" dhcp
netsh interface ip delete dns "Local Area Connection %LocalConnection%" all
ipconfig /release
ipconfig /flushdns
netsh interface ip delete arpcache
ipconfig /renew

set /P StaticIP="IP Subnet Gateway:"

set /p firstdns="Primary DNS: "

set /p seconddns="Secondary DNS: " 

netsh interface ip set dns name="Local Area Connection 2" source=static addr=none
netsh interface ip add dns name="Local Area Connection 2" %firstdns% index=1
netsh interface ip add dns name="Local Area Connection 2" %seconddns% index=2

ipconfig /release
ipconfig /flushdns
netsh interface ip delete arpcache
ipconfig /renew