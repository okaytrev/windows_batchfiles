REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableTcpChargen /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableUdpChargen /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableTcpQotd /t reg_dword /d 0 /f

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SimpTCP\Parameters /v EnableUdpQotd /t reg_dword /d 0 /f

net stop simptcp

net start simptcp

