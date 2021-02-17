@echo off
ping www.google.com -n 1 -w 1000
if errorlevel 1 echo Not connected