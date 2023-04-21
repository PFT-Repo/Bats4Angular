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
    ng g m core
    ng g m core/components
    ng g m core/auth
    ng g service core/coreservice
    ng g m features --routing
    ng g m features/components
    ng g m features/pages
    ng g m shared
    ng g environments
    cd /d "%Desktop%\%~1\%~2/src/app/
    md "features/services"
    md "core/standalones"
    cd /d "%Desktop%\%~1\%~2/src
    md "assets/i18n"
    md "assets/images"
    md "assets/icons"
    md "assets/data"
    cd /d "%Desktop%\%~1\%~2"
    npm install
    npm install primeflex @ngx-translate/core @ngx-translate/http-loader --save
    npm install --save-dev --save-exact prettier
    ng add @angular-eslint/schematics
    ng add @angular/material
    code .
    exit
) else (
    echo No se ha encontrado la carpeta Escritorio
)
