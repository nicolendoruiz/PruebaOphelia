/*Obtener el valor total vendido por cada producto en el año 2000*/
WITH WTPrecioProducto as (
		SELECT 
			FacturaDetalle.ProductoId
			,SUM(FacturaDetalle.FacturaDetalleCantidad)*ProductoPrecioValor AS ValorProducto
		FROM Financiera.FacturaDetalle
		INNER JOIN Almacen.ProductoPrecio on ProductoPrecio.ProductoPrecioId = FacturaDetalle.ProductoPrecioId
		INNER JOIN Financiera.Factura on FacturaDetalle.FacturaId=Factura.FacturaId
		WHERE YEAR(Factura.FacturaFecha) = 2000
		GROUP BY FacturaDetalle.ProductoId,ProductoPrecioValor
)	

	SELECT 
		  Producto.ProductoCodigo
		 ,Producto.ProductoDescripcion
		 ,SUM(ValorProducto) TotalVendido
	FROM Almacen.Producto 
	INNER JOIN WTPrecioProducto on Producto.ProductoId = WTPrecioProducto.ProductoId
	GROUP BY Producto.ProductoCodigo
			,Producto.ProductoDescripcion

/*Obtener la lista de precios de todos los productos */
	SELECT Producto.ProductoCodigo
		,Producto.ProductoDescripcion
		,ProductoPrecio.ProductoPrecioValor
		,ProductoPrecio.ProductoPrecioFecha
		,IIF(ProductoPrecio.ProductoPrecioEstado = 1, 'ACTIVO', 'INACTIVO') as ProductoPrecioEstado
	FROM Almacen.ProductoPrecio 
	INNER JOIN Almacen.Producto ON Producto.ProductoId=ProductoPrecio.ProductoId
	ORDER BY Producto.ProductoId

/*Obtener la lista de productos cuya existencia en el inventario haya llegado al mínimo permitido (5 unidades) */
	SELECT Producto.ProductoCodigo
		  ,Producto.ProductoDescripcion
		  ,ProductoStockCantidad
		  ,ProductoStockFecha
	FROM Almacen.ProductoStock
	INNER JOIN Almacen.Producto on ProductoStock.ProductoId=Producto.ProductoId
	WHERE ProductoStock.ProductoStockEstado=1 AND ProductoStock.ProductoStockCantidad=5

/*Obtener una lista de clientes no mayores de 35 años que hayan realizado compras entre el 
1 de febrero de 2000 y el 25 de mayo de 2000*/
	SELECT Cliente.ClienteId
		,Cliente.ClienteDocumento
		,Cliente.ClienteRazonSocial
		,Cliente.Edad
	FROM Financiera.Cliente
	INNER JOIN Financiera.Factura ON Cliente.ClienteId=Factura.ClienteId
	WHERE Cliente.Edad <=35
		AND Factura.FacturaFecha BETWEEN '2000/02/01' and '2000/05/25'
	GROUP BY Cliente.ClienteId
		,Cliente.ClienteDocumento
		,Cliente.ClienteRazonSocial
		,Cliente.Edad


