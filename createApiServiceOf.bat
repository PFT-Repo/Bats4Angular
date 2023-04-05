echo import { Injectable } from '@angular/core'; > mainservice.service.ts
echo import { HttpClient } from '@angular/common/http'; >> mainservice.service.ts
echo import { Observable, throwError } from 'rxjs'; >> mainservice.service.ts
echo import { retryWhen, delay, take, catchError } from 'rxjs/operators'; >> mainservice.service.ts
echo @Injectable({ providedIn: 'root' }) >> mainservice.service.ts
echo export class ApiService { >> mainservice.service.ts
echo   private apiUrl = 'https://randomuser.me/api/'; >> mainservice.service.ts
echo   private data: any; // local variable to store the retrieved data >> mainservice.service.ts
echo   constructor(private http: HttpClient) { } >> mainservice.service.ts
echo   getSomeData(): Observable<any> { >> mainservice.service.ts 
echo     return this.http.get<any>(this.apiUrl) >> mainservice.service.ts
echo       .pipe(
echo         retryWhen(errors => errors.pipe(delay(1000), take(3), catchError(err => throwError(err))))
echo       ); >> mainservice.service.ts
echo   }
echo } >> mainservice.service.ts