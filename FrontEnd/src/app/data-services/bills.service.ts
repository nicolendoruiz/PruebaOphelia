import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Factura } from '../contracts/models/factura.model';
import { RestApiService } from './rest-api.service';

@Injectable({
  providedIn: 'root'
})
export class BillsService {

  constructor(private restApiService:RestApiService ) { 

  }

  public getBills ():Observable<Factura[]>{
    return this.restApiService.get('factura');
  }

  public registerProduct(factura:Factura):Observable<Factura>{
    return this.restApiService.post('factura',factura)
  }

  public editProduct(factura:Factura):Observable<Factura>{
    return this.restApiService.put(`factura/${factura.FacturaId}`,factura)
  }

  public deleteProduct(factura:Factura):Observable<Factura>{
    return this.restApiService.delete(`factura/${factura.FacturaId}`,factura)
  }
}
