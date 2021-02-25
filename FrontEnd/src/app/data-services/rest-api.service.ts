import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RestApiService {
  private apiUrl = 'http://localhost:51015/api/';

  constructor(private http: HttpClient) {
  }

  public get(url: string): Observable<any> {
    return this.http.get(`${this.apiUrl}${url}`);
  }

  public post(url: string, objeto: any): Observable<any> {
    return this.http.post(`${this.apiUrl}${url}`, objeto);
  }

  public put(url: string, objeto: any): Observable<any> {
    return this.http.put(`${this.apiUrl}${url}`, objeto);
  }

  public delete(url: string, objeto: any): Observable<any> {
    return this.http.delete(`${this.apiUrl}${url}`, objeto);
  }
}
