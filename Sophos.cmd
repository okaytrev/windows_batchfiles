@echo off
echo This script will remove affected April 2019 Windows updates as per Sophos KBA https://sophos.com/kb/133945
echo Your machine should reboot back into Windows following this task
pause
echo Attempting removal of April 2019 Windows 8.1/Server 2012 R2 Updates
wusa /uninstall /kb:4493467 /quiet
wusa /uninstall /kb:4493446 /quiet
echo Attempting removal of April 2019 Windows 7/Server 2008 R2 Updates
wusa /uninstall /kb:4493448 /quiet
wusa /uninstall /kb:4493472 /quiet
echo Attempting removal of April 2019 Server 2008 Updates
wusa /uninstall /kb:4493458 /quiet
wusa /uninstall /kb:4493471 /quiet
echo Attempting removal of April 2019 Server 2012 Updates
wusa /uninstall /kb:4493450 /quiet
wusa /uninstall /kb:4493451 /quiet
exit