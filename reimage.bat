REM @ECHO off
SET inst=%~dp0

:BEGIN

IF NOT EXIST R:\ (NET USE R: \\10.10.160.251\imaging /user:hs-nas1\admin Scene-Judge-253)
IF NOT EXIST R:\ (
	ECHO Unable to map R:\.  You may need be having NAS or networking issues
	GOTO ERROR
		)

REM Detect computer Manufacturer
FOR /F "tokens=2 delims==" %%A IN ('WMIC COMPUTERSYSTEM GET Manufacturer /VALUE ^| FIND /I "Manufacturer ="') DO SET manufacturer =%%A

REM Detect Computer Model
FOR /F "tokens=2 delims==" %%A IN ('WMIC COMPUTERSYSTEM GET Model /VALUE ^| FIND /I "Model="') DO SET machine=%%A

REM Rename Actineon MACHINE name because they're lazy
REM IF /I "%machine%" == "To Be Filled By O.E.M." (SET MACHINE=W8LPW)
IF /I "%machine%" == "To Be Filled By O.E.M." (SET MACHINE=N310-B2001)

REM Rename Actineon MACHINE Wiisper
IF /I "%machine%" == "W81U" (SET MACHINE=S8DLP)

IF /I "%machine%" == "D34010WY" (SET MACHINE=D54250WY)

REM VirtualBox rename for testing purposess
IF /I "%machine%" == "VirtualBox" (SET MACHINE=D54250WY)

REM FWP77
IF /I "%machine%" == "D53427RK" (SET MACHINE=DC53427HYE)
IF /I "%machine%"  == "D33217GK" (SET MACHINE=DC53427HYE)

REM Machine name for FWP67 "DICP847S"
IF /I "%machine%"  == "DQS77GL_" (SET MACHINE=DC53427HYE)

REM build Celeron NUC image with this line. REM out afterward for capture/reimaging
REM IF /I "%machine%"  == "DICP847S" (SET MACHINE=DC53427HYE)

REM Henry Schein
IF /I "%machine%"  == "WAND Mini i3" (SET MACHINE=DC53427HYE)

REM testing DE7000 with NUC image
IF /I "%machine%"  == "NGBPM100" (SET MACHINE=DE7000)

REM UTC AIO to remove hyphen
IF /I "%machine%"  == "UTC-520B" (SET MACHINE=UTC520B)

REM MDKS to remove hyphen
IF /I "%machine%"  == "KEEX-6100" (SET MACHINE=KEEX6100)

REM Rename Wiisper 8 1U to HEXA 
IF /I "%machine%"  == "X10SLQ" (SET MACHINE=HEXA)
IF /I "%machine%"  == "DQ77MK__" (SET MACHINE=HEXA)

REM Rename Classic MEET4U
IF /I "%machine%"  == "BGP6710J" (SET MACHINE=MEET4U)

REM FWP61
IF /I "%machine%"  == "Medius DMP-61" (SET MACHINE=FWP61)
IF /I "%machine%"  == "DMP-61" (SET MACHINE=FWP61)
IF /I "%machine%"  == "Medius" (SET MACHINE=FWP61)
IF /I "%machine%"  == "DH61AG__" (SET MACHINE=FWP61)

REM Rando Hardware 
IF /I "%machine%"  == "N310-B2001" (SET MACHINE=N310-B2001)

REM Random Piece of Hardware. THIS IS TEMPORARY
IF /I "%machine%"  == "PRO329931" (SET MACHINE=N310-B2531)
REM Random Piece of Hardware. Seneca
IF /I "%machine%"  == "PRO356484" (SET MACHINE=N310-B2001)
IF /I "%machine%"  == "pro356499" (SET MACHINE=N310-B2001)
IF /I "%machine%"  == "pro356488" (SET MACHINE=N310-B2001)
REM More hardware from other vendors. This one is a NUC
IF /I "%machine%" == "pro358500" (SET MACHINE=DC53427HYE)
IF /I "%machine%" == "pro358459" (SET MACHINE=DC53427HYE)

REM Rename i3 Gigabyte to i5
IF /I "%machine%"  == "MMLP3AP-00" (SET MACHINE=MMLP5AP-00)
REM Rename i5 Gigabyte to i7
IF /I "%machine%"  == "GB-BXi5G-760" (SET MACHINE=GB-BXi7G3-760)
REM Rename i5 Gigabyte TEMPORARY
REM IF /I "%machine%"  == "GB-BXi5G-760" (SET MACHINE=MMLP5AP-00)

REM rename Gigabyte Celeron
IF /I "%machine%" == "GB-BXCE-3205" (SET MACHINE=GB-BXCE-3205)
IF /I "%machine%" == "GB-BXCE-3205U" (SET MACHINE=GB-BXCE-3205)

REM This is creating an alias for the Gigabyte i7 without discrete graphics. - Steven
IF /I "%machine%"  == "M4HM87P-00" (SET MACHINE=GB-BXi7G3-760)

REM Rename Dell OptiPlex 7010
IF /I "%machine%"  == "OptiPlex 7010" (SET MACHINE=Optiplex7010)
REM Rename Dell OptiPlex 780 to 7010
IF /I "%machine%"  == "OPTIPLEX 780" (SET MACHINE=Optiplex7010)
REM Rename Dell OptiPlex 960 to 7010
IF /I "%machine%"  == "OPTIPLEX 960" (SET MACHINE=Optiplex7010)

REM Rename Asus T300CHI
IF /I "%machine% == "T300CHI" (SET MACHINE=T300CHI)

IF /I "%manufacturer%" == "Apple" (SET MACHINE=Apple)
IF /I "%manufacturer%" == "ASUS" (SET MACHINE=ASUS)

ECHO Computer model: "%machine%"

ECHO WES7E - WES7E
ECHO WES7P - WES7P
ECHO PRO - Windows 7 Pro OEM
ECHO APP - Appliance Image
ECHO UEFI - Windows 8.1 UEFI

set /P imagetype="Enter a image type: "

IF /I "%imagetype%" == "APP" (GOTO Appliance)
IF /I "%imagetype%" == "UEFI" (GOTO UEFI)

DISKPART /S r:\images\diskpart-step0.txt
DISM /Apply-Image /ImageFile:"R:\images\%machine%-%imagetype%.wim" /Index:1 /ApplyDir:W:\
BCDEDIT /delete {default}
BCDBOOT W:\Windows /l en-US
BCDEDIT /TIMEOUT 5
BCDEDIT /SET {default} description "Digital Sign"
GOTO END

:UEFI
DISKPART /S diskpart-uefi.txt
DISM /Apply-Image /ImageFile:"R:\images\%machine%-%imagetype%.wim" /Index:1 /ApplyDir:W:\
BCDBOOT W:\Windows /l en-US

GOTO END

:Appliance
R:
CD R:\ds-fwi\Reimage\Reimage-FWI-x64\
Call R:\ds-fwi\Reimage\Reimage-FWI-x64\Reimage.cmd


GOTO END


:END
pause
wpeutil reboot

:ERROR
ECHO Errors were encountered during imaging.  Please review error messages and resolve issues.



