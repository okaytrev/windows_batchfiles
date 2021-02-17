@echo off
ping www.google.com -n 1 -w 1000
if errorlevel 1 (GOTO 20) ELSE (GOTO 30)

:20
echo PC is offline 
GOTO 40

:30
echo PC is working
GOTO 40

:40
pause