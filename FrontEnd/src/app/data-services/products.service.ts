import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Producto } from '../contracts/models/producto.model';
import { RestApiService } from './rest-api.service';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {

  constructor(private restApiService: RestApiService) {
  }

  public getProducts(): Observable<Producto[]> {
    return this.restApiService.get('producto');
  }

  public registerProduct(producto:Producto):Observable<Producto>{
    return this.restApiService.post('producto',producto)
  }

  public editProduct(product:Producto):Observable<Producto>{
    return this.restApiService.put(`producto/${product.ProductoId}`,product)
  }

  public deleteProduct(product:Producto):Observable<Producto>{
    return this.restApiService.delete(`producto/${product.ProductoId}`,product)
  }
}
