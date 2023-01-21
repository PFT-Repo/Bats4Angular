@echo off
echo Bienvenido al creador de proyectos, es posible que te pida señalar para incluir analytics en el proyecto
set "Desktop=%userprofile%\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Escritorio"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Escritorio"

if exist "%Desktop%" (
    
if "%~1"=="" (
    echo Por favor proporcione los nombres de la carpeta que contendra el proyecto y el nombre del proyecto
    exit /b
)
start cmd.exe /k "cd %Desktop% && md %~1 && exit"
echo Cuando finalice la instalación, cierra y dale ENTER
start cmd.exe /k "cd %Desktop%/%~1 && ng new %~2 --skip-install --routing --style scss && cd %Desktop%/%~1/%~2 && ng g m components/components && ng g service service/service && exit"
start cmd.exe /k "cd %Desktop%/%~1/%~2  && code . && npm i && exit"
) else (
    echo No se ha encontrado la carpeta Escritorio
)