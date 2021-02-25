import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { EActionType } from 'src/app/contracts/enums/action-type.enum';
import { Producto } from 'src/app/contracts/models/producto.model';
import { ProductsService } from 'src/app/data-services/products.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.scss']
})
export class ProductsComponent implements OnInit, OnDestroy {

  private productsSubscription: Subscription;
  public productsList: Producto[] = [];
  private actionType: EActionType;

  constructor(private productsServices: ProductsService) {
  }

  ngOnInit(): void {
    this.actionType = EActionType.None;
    this.registerEvents();
  }

  ngOnDestroy(): void {
    this.productsSubscription.unsubscribe();
  }

  private registerEvents() {
    this.productsSubscription = this.productsServices.getProducts().subscribe((products: Producto[]) => {
      this.productsList = products;
      console.log(products);
    })
  }

  public saveProduct(evt: any) {
    debugger;
    const product: Producto = evt.changes[0].data;
    delete product['ProductoId'];
    if (product) {
      this.productsServices.registerProduct(product).subscribe(() => { });
    }
  }

  public editProduct(evt: any) {
    debugger;
    console.log(evt.changes[0].data)
    const product:Producto = this.productsList.find(p => p.ProductoId === evt.changes[0].key);
    if (product) {
      product['ProductId'] = evt.changes[0].key; 
      const data = evt.changes[0].data;
      Object.keys(data).forEach(k => {
        product[k] = data[k];
      });
    }
    if (product) {
      this.productsServices.editProduct(product).subscribe(() => { });
    }
  }

  public deleteProduct(evt: any) {
    debugger;
    console.log(evt.data)
    const product: Producto = evt.data;
    if (product) {
      this.productsServices.deleteProduct(product).subscribe(() => { });
    }
  }

  public startEditing() {
    this.actionType = EActionType.Edit;
  }

  public initNewRow() {
    this.actionType = EActionType.Save;
  }

  public rowRemoving() {
    this.actionType = EActionType.Remove;
  }

  public actionCanceled() {
    this.actionType = EActionType.None;
  }

  public saveOrEditProduct(evt: any) {
    debugger;
    if (this.actionType === EActionType.Save) {
      this.saveProduct(evt);
    } else if (this.actionType === EActionType.Edit) {
      this.editProduct(evt);
    }

  }

}