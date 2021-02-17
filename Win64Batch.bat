start /wait \reader\AdbeRdr950_en_US.exe /sPB /msi EULA_ACCEPT=YES REMOVE_PREVIOUS=YES 
@echo "Reader Installed"
Pause
start /wait \flash\install_flash_player_11_active_x.exe  
@echo "Flash Installed"
Pause
start /wait \klite\K-Lite_Codec_Pack_970_Mega EULA_ACCEPT=YES
@echo "K-Lite Installed"
Pause
start /wait \mse\MSEInstall_x64_en_us /runwgacheck 
@echo "MSE Installed"
Pause
start /wait \TightVNC\tightvnc-2.7.10-setup-64bit.msi EULA_ACCEPT=YES
@echo "Tight VNC Installed"
Pause
start /wait \VLC\vlc-2.0.0-win32 EULA_ACCEPT=YES
@echo "VLC Installed"
Pause

set /P version="Content Player Version: "

pause 

set /P key="License key: "

pause
cmd /c msiexec /i \Builds\ContentPlayer.%version%\contentplayer.msi LICENSEKEY=%key% /quiet
pause

@echo "%version% was succesfully installed" 


c:\
wscuiu.cpl

powercfg.cpl

taskschd.msc

wuapp

firewall.cpl

sysdm.cpl

control.exe /name Microsoft.NetworkandSharingCenter








