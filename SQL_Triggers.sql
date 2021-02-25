USE [OpheliaBD]
GO

/****** Object:  Trigger [Almacen].[ActualizarProductoPrecio]    Script Date: 25/02/2021 2:15:40 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Almacen].[ActualizarProductoPrecio] on [Almacen].[ProductoPrecio]
FOR INSERT
AS 
BEGIN	

	DECLARE @ProductoId INT, @Fecha datetime 
	SELECT @ProductoId=inserted.ProductoId, 
		   @Fecha =inserted.ProductoPrecioFecha
	FROM inserted inserted

	UPDATE Almacen.ProductoPrecio SET ProductoPrecioEstado = 0
	WHERE ProductoPrecioId = (SELECT MAX(ProductoPrecioId) 
							  FROM Almacen.ProductoPrecio
							  WHERE ProductoPrecio.ProductoId=@ProductoId 
									AND ProductoPrecioFecha<@Fecha);

END
GO

ALTER TABLE [Almacen].[ProductoPrecio] ENABLE TRIGGER [ActualizarProductoPrecio]
GO

-------------------------------------------------

/****** Object:  Trigger [Financiera].[RegistrarFacturaDetalle]    Script Date: 25/02/2021 2:16:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Financiera].[RegistrarFacturaDetalle] on [Financiera].[FacturaDetalle]
FOR INSERT
AS 
BEGIN	

	DECLARE @ProductoId INT
			,@FacturaDetalleId datetime
			,@CantidadStock INT
			,@CantidadFactura INT
			,@UltimoStock INT
			,@PrecioProductoId INT

	SELECT @ProductoId=inserted.ProductoId
		   ,@FacturaDetalleId = inserted.FacturaDetalleId
		   ,@CantidadFactura = inserted.FacturaDetalleCantidad
	FROM inserted inserted

	SELECT @CantidadStock = ProductoStockCantidad
		   ,@UltimoStock = ProductoStockId
	FROM Almacen.ProductoStock 
	WHERE ProductoStock.ProductoId = @ProductoId AND ProductoStockEstado = 1;

	IF(@CantidadStock<@CantidadFactura OR @CantidadStock=5)
	BEGIN
		 ROLLBACK TRANSACTION
        RAISERROR ('No se puede realizar la inserción, restricción.', 16,1 ) 
	END
	ELSE 
	BEGIN
		UPDATE Almacen.ProductoStock SET ProductoStockEstado = 0 WHERE ProductoStockId=@UltimoStock;

		INSERT INTO [Almacen].[ProductoStock]
           ([ProductoId],[ProductoStockCantidad],[ProductoStockEstado],[ProductoStockFecha])
		VALUES
           (@ProductoId,(@CantidadStock-@CantidadFactura),1,GETDATE())

		SELECT @PrecioProductoId = ProductoPrecioId FROM Almacen.ProductoPrecio WHERE ProductoPrecio.ProductoId=@ProductoId and ProductoPrecio.ProductoPrecioEstado=1;
		UPDATE Financiera.FacturaDetalle SET ProductoPrecioId=@PrecioProductoId WHERE FacturaDetalleId = @FacturaDetalleId
	END

END
GO

ALTER TABLE [Financiera].[FacturaDetalle] ENABLE TRIGGER [RegistrarFacturaDetalle]
GO

