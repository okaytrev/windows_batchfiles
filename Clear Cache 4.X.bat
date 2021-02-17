ping 127.0.0.1 -n 30
del "%fwi%\signage\content\cache\*" /Q
ping 127.0.0.1 -n 5
start "Content Player" "C:\Program Files (x86)\Four Winds Interactive\Content Player\Signage.exe"