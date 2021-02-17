@ECHO OFF
SET inst=%~dp0

IF NOT EXIST R:\ (NET USE R: \\HS-NAS1\images /user:hs-nas1\admin Scene-Judge-253)
rem IF NOT EXIST S:\ (NET USE S: \\HS-IMAGING1\ds-fwi /user:hs-imaging1\imaging Fun-Command-1)

REM Detect computer Manufacturer
FOR /F "tokens=2 delims==" %%A IN ('WMIC COMPUTERSYSTEM GET Manufacturer /VALUE ^| FIND /I "Manufacturer ="') DO SET manufacturer =%%A

REM Rename Actineon MANUFACTURER name because they're lazy
IF /I "%manufacturer%" == "To Be Filled By O.E.M." (SET MANUFACTURER=Actineon)

REM Detect Computer Model
FOR /F "tokens=2 delims==" %%A IN ('WMIC COMPUTERSYSTEM GET Model /VALUE ^| FIND /I "Model="') DO SET machine=%%A

REM Rename Actineon MACHINE name because they're lazy
IF /I "%machine%" == "To Be Filled By O.E.M." (SET MACHINE=W8LPW)

IF /I "%machine%" == "D34010WY" (SET MACHINE=D54250WY)
IF /I "%machine%" == "D53427RK" (SET MACHINE=DC53427HYE)
IF /I "%machine%" == "D33217GK" (SET MACHINE=DC53427HYE)

IF /I "%manufacturer%" == "Apple" (SET MACHINE=Apple)
IF /I "%manufacturer%" == "ASUS" (SET MACHINE=ASUS)

ECHO Computer model: "%machine%"
ECHO Naming convention MODEL-WES7P - WES7E - PRO
set /P imagename="Enter a image name: "

IF EXIST C:\WINDOWS (DISM /Capture-Image /ImageFile:"R:\Images\%imagename%.wim" /CaptureDir:C:\ /Name:"%imagename%")
IF EXIST d:\WINDOWS (DISM /Capture-Image /ImageFile:"R:\Images\%imagename%.wim" /CaptureDir:d:\ /Name:"%imagename%")
IF EXIST e:\WINDOWS (DISM /Capture-Image /ImageFile:"R:\Images\%imagename%.wim" /CaptureDir:e:\ /Name:"%imagename%")
pause
wpeutil reboot