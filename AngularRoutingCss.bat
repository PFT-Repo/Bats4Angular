@echo off
start cmd.exe /k "cd %UserProfile%\Desktop> && MKDIR test"
start cmd.exe /k "MKDIR test"
start cmd.exe /k "cd %UserProfile%\Desktop> && MKDIR test"
pause
echo Cuando finalice la instalación, cierra y dale ENTER
start cmd.exe /k "cd %UserProfile%\Desktop/test && ng new prueba --skip-install --routing --style css && cd C:\Users\formacio\Desktop/test/prueba && ng g m components/components && ng g service service/service"
pause
start cmd.exe /k "cd %UserProfile%\Desktop/test/prueba  && code . && npm i"