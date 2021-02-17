@echo off

CD C:\Windows\System32

Echo --------------------------------
Echo uninstalling current license key
echo --------------------------------

cscript //B slmgr.vbs /upk

Echo --------------------------------
Echo installing FWI license key
echo --------------------------------

cscript //B slmgr.vbs /ipk "TPRMN-6CY87-VP34K-WFRP9-T84CK"

Echo --------------------------------
Echo activating new license key
echo --------------------------------

cscript //B slmgr.vbs /ato

ECHO --------------------------------
ECHO See license status
ECHO Script complete
ECHO Press Okay
ECHO --------------------------------

slmgr.vbs /dli

exit