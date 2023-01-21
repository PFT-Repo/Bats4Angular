@echo off
set "Desktop=%userprofile%\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Escritorio"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Escritorio"

if exist "%Desktop%" (
    if "%~1"=="" (
        echo Por favor proporcione los nombres de la carpeta que contendra el proyecto y el nombre del proyecto
        exit /b
    )
    md "%Desktop%\%~1"
    cd /d "%Desktop%\%~1"
    ng new %~2 --skip-install --routing --style scss
    cd /d "%Desktop%\%~1\%~2"
    ng g m components/components
    ng g service services/services
    code .
    echo Dale enter para cerrar la terminal
    pause 
    exit
) else (
    echo No se ha encontrado la carpeta Escritorio
)
