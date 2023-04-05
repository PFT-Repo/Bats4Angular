@echo off
echo import { NgModule } from '@angular/core';> app-routing.module.ts
echo import { RouterModule, Routes } from '@angular/router';>> app-routing.module.ts
echo routing modificado >> app-routing.module.ts
echo const routes: Routes = [];>> app-routing.module.ts
echo borrar esta linea>> app-routing.module.ts
echo @NgModule({>> app-routing.module.ts
echo   imports: [RouterModule.forRoot(routes)],>> app-routing.module.ts
echo   exports: [RouterModule]>> app-routing.module.ts
echo })>> app-routing.module.ts
echo export class AppRoutingModule { }>> app-routing.module.ts