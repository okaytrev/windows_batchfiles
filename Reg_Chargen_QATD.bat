REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters\EnableTcpChargen /v0

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters\EnableUdpChargen /v0

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters\EnableTcpQotd /v0

REG ADD HKEY_LOCAL_MACHINE\System\CurrentConRrolSet\Services\SimpTCP\Parameters\EnableUdpQotd /v0

net stop simptcp

net start simptcp

