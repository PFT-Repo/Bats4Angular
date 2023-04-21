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
    ng g c core/components/back-btn
    ng g s core/services/navigation
    ng g m core/api
    ng g interface core/api/contracts/iGet    
    ng g interface core/api/contracts/iGetAll
    ng g service core/api/implementations/comics
    ng g service core/api/implementations/characters
    ng g m features --routing
    ng g m features/comics --routing
    ng g m features/comics/components
    ng g c features/comics/components/comic-card
    ng g c features/comics/components/comic-carousel
    ng g c features/comics/components/comic-detailed-card
    ng g c features/comics/components/comic-square-card
    ng g m features/comics/pages
    ng g c features/comics/pages/comics
    ng g c features/comics/pages/comic-detail
    ng g m features/characters --routing
    ng g m features/characters/components
    ng g c features/characters/components/character-card
    ng g c features/characters/components/character-spotlight-card
    ng g c features/characters/components/character-list
    ng g m features/characters/pages    
    ng g c features/characters/pages/characters
    ng g c features/characters/pages/character-detail
    ng g m shared
    ng g m shared/components 
    ng g c shared/components/header
    ng g c shared/components/footer
    ng g m shared/models
    ng g interface shared/models/character-view-model
    ng g interface shared/models/comic-view-model    
    ng g interface shared/models/character
    ng g interface shared/models/comic
    ng g s shared/utils/character-dto-2-vm 
    ng g s shared/utils/comic-dto-2-vm
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
    npm install @angular/youtube-player primeflex @ngx-translate/core @ngx-translate/http-loader --save
    npm install --save-dev --save-exact prettier
    ng add @angular-eslint/schematics
    ng add @angular/material
    code .
    exit
) else (
    echo No se ha encontrado la carpeta Escritorio
)
