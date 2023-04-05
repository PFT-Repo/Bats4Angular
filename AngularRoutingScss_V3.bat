@echo off
set "Desktop=%userprofile%\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Escritorio"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Desktop"
if not exist "%Desktop%" set "Desktop=%userprofile%\Onedrive\Escritorio"

set "Url=https://randomuser.me/api/"
where ng >nul 2>&1 || (echo Angular CLI is not installed. Please install it and try again. & exit /b)

if exist "%Desktop%" (
    if "%~1"=="" (
        echo Por favor proporcione los nombres de la carpeta que contendra el proyecto y el nombre del proyecto
        exit /
    )
    md "%Desktop%\%~1"
    cd /d "%Desktop%\%~1"
    ng new %~2 --skip-install --routing --style scss
    if %errorlevel% neq 0 (echo An error occurred while running the previous command. & exit /b)
    cd /d "%Desktop%\%~1\%~2"
    ng g m components
    if %errorlevel% neq 0 (echo An error occurred while running the previous command. & exit /b)
    ng g service services/mainservice
    if %errorlevel% neq 0 (echo An error occurred while running the previous command. & exit /b)
    cd /d "%Desktop%\%~1\%~2/src/app/services"
    call %Desktop%\bats\createApiServiceOf.bat %Url%
    cd /d ..\..
    md "pages"
    cd /d ..\..
    code .
    echo Dale enter para cerrar la terminal
    pause 
    exit
) else (
    echo No se ha encontrado la carpeta Escritorio
)
