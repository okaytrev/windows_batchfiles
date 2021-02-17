netsh interface ip delete dns "Local Area Connection 2" all
netsh interface ip set address "Local Area Connection 2" dhcp
netsh interface ip delete dns "Local Area Connection 2" all
ipconfig /release
ipconfig /flushdns
netsh interface ip delete arpcache
ipconfig /renew


set /P StaticIP="static IP info: "

set /P firstdns="DNS1: "

set /P seconddns="DNS2: " 

@echo %seconddns%
@echo %firstdns%


rem start netsh interface ip delete dns "Local Area Connection 2" all
netsh interface ip set dns name="Local Area Connection 2" source=static addr=none
netsh interface ip add dns name="Local Area Connection 2" %firstdns% index=1
netsh interface ip add dns name="Local Area Connection 2" %seconddns% index=2

netsh interface ip set address "Local Area Connection 2" static %staticIP%

ipconfig /release
ipconfig /flushdns
netsh interface ip delete arpcache
ipconfig /renew