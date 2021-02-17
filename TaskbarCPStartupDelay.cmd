ping localhost -n 15 > nul

taskkill /f /im explorer.exe 

ping localhost -n 5 > nul

start explorer.exe

ping localhost -n 5 > nul

start /b "" /d"C:\Program Files (x86)\Four Winds Interactive\Content Player" "Signage.exe"
