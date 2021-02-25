USE [OpheliaBD]
GO
/****** Object:  Schema [Almacen]    Script Date: 24/02/2021 10:03:53 p. m. ******/
CREATE SCHEMA [Almacen]
GO
/****** Object:  Schema [Financiera]    Script Date: 24/02/2021 10:03:53 p. m. ******/
CREATE SCHEMA [Financiera]
GO
/****** Object:  Schema [Seguridad]    Script Date: 24/02/2021 10:03:53 p. m. ******/
CREATE SCHEMA [Seguridad]
GO
/****** Object:  Table [Almacen].[Producto]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Almacen].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoCodigo] [int] NULL,
	[ProductoEstado] [bit] NULL,
	[ProductoDescripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Almacen].[ProductoPrecio]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Almacen].[ProductoPrecio](
	[ProductoPrecioId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NULL,
	[ProductoPrecioFecha] [datetime] NULL,
	[ProductoPrecioValor] [numeric](10, 2) NULL,
	[ProductoPrecioEstado] [bit] NULL,
 CONSTRAINT [PK_ProductoPrecio] PRIMARY KEY CLUSTERED 
(
	[ProductoPrecioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Almacen].[ProductoStock]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Almacen].[ProductoStock](
	[ProductoStockId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NULL,
	[ProductoStockCantidad] [int] NULL,
	[ProductoStockEstado] [bit] NULL,
	[ProductoStockFecha] [datetime] NULL,
 CONSTRAINT [PK_ProductoStock] PRIMARY KEY CLUSTERED 
(
	[ProductoStockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Financiera].[Cliente]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financiera].[Cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteDocumento] [int] NULL,
	[ClienteRazonSocial] [nvarchar](max) NULL,
	[Edad] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Financiera].[Factura]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financiera].[Factura](
	[FacturaId] [int] IDENTITY(1,1) NOT NULL,
	[FacturaNumero] [varchar](20) NULL,
	[FacturaFecha] [datetime] NULL,
	[FacturaFechaRegistro] [datetime] NULL,
	[ClienteId] [int] NULL,
	[FacturaEstadoId] [int] NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Financiera].[FacturaDetalle]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financiera].[FacturaDetalle](
	[FacturaDetalleId] [int] IDENTITY(1,1) NOT NULL,
	[FacturaId] [int] NULL,
	[ProductoId] [int] NULL,
	[FacturaDetalleCantidad] [int] NULL,
	[FacturaDetalleEstado] [bit] NULL,
	[UsuarioId] [int] NOT NULL,
	[ProductoPrecioId] [int] NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[FacturaDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Financiera].[FacturaEstado]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financiera].[FacturaEstado](
	[FacturaEstadoId] [int] IDENTITY(1,1) NOT NULL,
	[FacturaEstadoDescripcion] [nchar](100) NULL,
	[FacturaEstadoEstado] [bit] NULL,
 CONSTRAINT [PK_FacturaEstado] PRIMARY KEY CLUSTERED 
(
	[FacturaEstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Usuario]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioDocumento] [int] NULL,
	[UsuarioNombre] [varchar](100) NULL,
	[UsuarioApellido] [varchar](100) NULL,
	[UsuarioEstado] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Almacen].[Producto] ON 
GO
INSERT [Almacen].[Producto] ([ProductoId], [ProductoCodigo], [ProductoEstado], [ProductoDescripcion]) VALUES (1, 1, 1, N'Arroz')
GO
INSERT [Almacen].[Producto] ([ProductoId], [ProductoCodigo], [ProductoEstado], [ProductoDescripcion]) VALUES (2, 345, 1, N'Frijol')
GO
INSERT [Almacen].[Producto] ([ProductoId], [ProductoCodigo], [ProductoEstado], [ProductoDescripcion]) VALUES (3, 3, 1, N'Lenteja')
GO
INSERT [Almacen].[Producto] ([ProductoId], [ProductoCodigo], [ProductoEstado], [ProductoDescripcion]) VALUES (5, 80, 1, N'Yuca')
GO
INSERT [Almacen].[Producto] ([ProductoId], [ProductoCodigo], [ProductoEstado], [ProductoDescripcion]) VALUES (9, 3456345, 1, N'Papa')
GO
SET IDENTITY_INSERT [Almacen].[Producto] OFF
GO
SET IDENTITY_INSERT [Almacen].[ProductoPrecio] ON 
GO
INSERT [Almacen].[ProductoPrecio] ([ProductoPrecioId], [ProductoId], [ProductoPrecioFecha], [ProductoPrecioValor], [ProductoPrecioEstado]) VALUES (7, 1, CAST(N'2021-02-23T20:44:41.967' AS DateTime), CAST(2300.00 AS Numeric(10, 2)), 0)
GO
INSERT [Almacen].[ProductoPrecio] ([ProductoPrecioId], [ProductoId], [ProductoPrecioFecha], [ProductoPrecioValor], [ProductoPrecioEstado]) VALUES (8, 1, CAST(N'2021-02-23T20:44:47.523' AS DateTime), CAST(2400.00 AS Numeric(10, 2)), 0)
GO
INSERT [Almacen].[ProductoPrecio] ([ProductoPrecioId], [ProductoId], [ProductoPrecioFecha], [ProductoPrecioValor], [ProductoPrecioEstado]) VALUES (9, 1, CAST(N'2021-02-23T20:55:25.210' AS DateTime), CAST(2600.00 AS Numeric(10, 2)), 0)
GO
INSERT [Almacen].[ProductoPrecio] ([ProductoPrecioId], [ProductoId], [ProductoPrecioFecha], [ProductoPrecioValor], [ProductoPrecioEstado]) VALUES (10, 1, CAST(N'2021-02-24T13:50:53.020' AS DateTime), CAST(2800.00 AS Numeric(10, 2)), 1)
GO
INSERT [Almacen].[ProductoPrecio] ([ProductoPrecioId], [ProductoId], [ProductoPrecioFecha], [ProductoPrecioValor], [ProductoPrecioEstado]) VALUES (11, 2, CAST(N'2021-02-24T14:09:12.100' AS DateTime), CAST(3200.00 AS Numeric(10, 2)), 1)
GO
SET IDENTITY_INSERT [Almacen].[ProductoPrecio] OFF
GO
SET IDENTITY_INSERT [Almacen].[ProductoStock] ON 
GO
INSERT [Almacen].[ProductoStock] ([ProductoStockId], [ProductoId], [ProductoStockCantidad], [ProductoStockEstado], [ProductoStockFecha]) VALUES (1, 1, 6, 0, CAST(N'2021-02-24T13:19:39.200' AS DateTime))
GO
INSERT [Almacen].[ProductoStock] ([ProductoStockId], [ProductoId], [ProductoStockCantidad], [ProductoStockEstado], [ProductoStockFecha]) VALUES (2, 2, 5, 1, CAST(N'2021-02-24T13:19:51.873' AS DateTime))
GO
INSERT [Almacen].[ProductoStock] ([ProductoStockId], [ProductoId], [ProductoStockCantidad], [ProductoStockEstado], [ProductoStockFecha]) VALUES (3, 1, 10, 0, CAST(N'2021-02-24T18:50:41.503' AS DateTime))
GO
INSERT [Almacen].[ProductoStock] ([ProductoStockId], [ProductoId], [ProductoStockCantidad], [ProductoStockEstado], [ProductoStockFecha]) VALUES (4, 1, 6, 1, CAST(N'2021-02-24T18:59:40.980' AS DateTime))
GO
SET IDENTITY_INSERT [Almacen].[ProductoStock] OFF
GO
SET IDENTITY_INSERT [Financiera].[Cliente] ON 
GO
INSERT [Financiera].[Cliente] ([ClienteId], [ClienteDocumento], [ClienteRazonSocial], [Edad]) VALUES (1, 1117549892, N'Nicol Dayana Endo Ruiz', 23)
GO
INSERT [Financiera].[Cliente] ([ClienteId], [ClienteDocumento], [ClienteRazonSocial], [Edad]) VALUES (3, 1117343423, N'Jessica Andrea Endo Ruiz', 40)
GO
SET IDENTITY_INSERT [Financiera].[Cliente] OFF
GO
SET IDENTITY_INSERT [Financiera].[Factura] ON 
GO
INSERT [Financiera].[Factura] ([FacturaId], [FacturaNumero], [FacturaFecha], [FacturaFechaRegistro], [ClienteId], [FacturaEstadoId], [UsuarioId]) VALUES (2, N'2021230201', CAST(N'2021-02-23T22:44:56.353' AS DateTime), CAST(N'2021-02-23T22:44:56.353' AS DateTime), 1, 1, 1)
GO
INSERT [Financiera].[Factura] ([FacturaId], [FacturaNumero], [FacturaFecha], [FacturaFechaRegistro], [ClienteId], [FacturaEstadoId], [UsuarioId]) VALUES (3, N'2021230202', CAST(N'2000-02-01T00:00:00.000' AS DateTime), CAST(N'2021-02-23T22:49:38.787' AS DateTime), 1, 1, 1)
GO
INSERT [Financiera].[Factura] ([FacturaId], [FacturaNumero], [FacturaFecha], [FacturaFechaRegistro], [ClienteId], [FacturaEstadoId], [UsuarioId]) VALUES (4, N'2021230202', CAST(N'2000-05-25T00:00:00.000' AS DateTime), CAST(N'2021-02-23T22:50:47.993' AS DateTime), 1, 1, 1)
GO
INSERT [Financiera].[Factura] ([FacturaId], [FacturaNumero], [FacturaFecha], [FacturaFechaRegistro], [ClienteId], [FacturaEstadoId], [UsuarioId]) VALUES (5, N'2021240201', CAST(N'2000-05-25T00:00:00.000' AS DateTime), CAST(N'2021-02-23T22:50:47.993' AS DateTime), 1, 1, 1)
GO
SET IDENTITY_INSERT [Financiera].[Factura] OFF
GO
SET IDENTITY_INSERT [Financiera].[FacturaDetalle] ON 
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (2, 2, 1, 3, 1, 1, 9)
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (3, 3, 1, 3, 1, 1, 9)
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (4, 4, 1, 2, 1, 1, 10)
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (5, 4, 2, 2, 1, 1, 11)
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (6, 5, 1, 1, 1, 1, 10)
GO
INSERT [Financiera].[FacturaDetalle] ([FacturaDetalleId], [FacturaId], [ProductoId], [FacturaDetalleCantidad], [FacturaDetalleEstado], [UsuarioId], [ProductoPrecioId]) VALUES (13, 5, 1, 4, 1, 1, 10)
GO
SET IDENTITY_INSERT [Financiera].[FacturaDetalle] OFF
GO
SET IDENTITY_INSERT [Financiera].[FacturaEstado] ON 
GO
INSERT [Financiera].[FacturaEstado] ([FacturaEstadoId], [FacturaEstadoDescripcion], [FacturaEstadoEstado]) VALUES (1, N'PENDIENTE                                                                                           ', 1)
GO
INSERT [Financiera].[FacturaEstado] ([FacturaEstadoId], [FacturaEstadoDescripcion], [FacturaEstadoEstado]) VALUES (2, N'PAGADA                                                                                              ', 1)
GO
INSERT [Financiera].[FacturaEstado] ([FacturaEstadoId], [FacturaEstadoDescripcion], [FacturaEstadoEstado]) VALUES (3, N'RECHAZADA                                                                                           ', 1)
GO
SET IDENTITY_INSERT [Financiera].[FacturaEstado] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] ON 
GO
INSERT [Seguridad].[Usuario] ([UsuarioId], [UsuarioDocumento], [UsuarioNombre], [UsuarioApellido], [UsuarioEstado]) VALUES (1, 1117549892, N'Dayana', N'Ruiz', 1)
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] OFF
GO
ALTER TABLE [Almacen].[ProductoPrecio]  WITH CHECK ADD  CONSTRAINT [FK_ProductoPrecio_Producto] FOREIGN KEY([ProductoId])
REFERENCES [Almacen].[Producto] ([ProductoId])
GO
ALTER TABLE [Almacen].[ProductoPrecio] CHECK CONSTRAINT [FK_ProductoPrecio_Producto]
GO
ALTER TABLE [Almacen].[ProductoStock]  WITH CHECK ADD  CONSTRAINT [FK_ProductoStock_Producto] FOREIGN KEY([ProductoId])
REFERENCES [Almacen].[Producto] ([ProductoId])
GO
ALTER TABLE [Almacen].[ProductoStock] CHECK CONSTRAINT [FK_ProductoStock_Producto]
GO
ALTER TABLE [Financiera].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [Financiera].[Cliente] ([ClienteId])
GO
ALTER TABLE [Financiera].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [Financiera].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_FacturaEstado] FOREIGN KEY([FacturaEstadoId])
REFERENCES [Financiera].[FacturaEstado] ([FacturaEstadoId])
GO
ALTER TABLE [Financiera].[Factura] CHECK CONSTRAINT [FK_Factura_FacturaEstado]
GO
ALTER TABLE [Financiera].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Seguridad].[Usuario] ([UsuarioId])
GO
ALTER TABLE [Financiera].[Factura] CHECK CONSTRAINT [FK_Factura_Usuario]
GO
ALTER TABLE [Financiera].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Factura] FOREIGN KEY([FacturaId])
REFERENCES [Financiera].[Factura] ([FacturaId])
GO
ALTER TABLE [Financiera].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Factura]
GO
ALTER TABLE [Financiera].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Producto] FOREIGN KEY([ProductoId])
REFERENCES [Almacen].[Producto] ([ProductoId])
GO
ALTER TABLE [Financiera].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Producto]
GO
ALTER TABLE [Financiera].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_ProductoPrecio] FOREIGN KEY([ProductoPrecioId])
REFERENCES [Almacen].[ProductoPrecio] ([ProductoPrecioId])
GO
ALTER TABLE [Financiera].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_ProductoPrecio]
GO
/****** Object:  StoredProcedure [Almacen].[ObtenerListaClientes]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Almacen].[ObtenerListaClientes] 
	
AS
BEGIN
	SET NOCOUNT ON;

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
	

END
GO
/****** Object:  StoredProcedure [Almacen].[ObtenerListaPrecios]    Script Date: 24/02/2021 10:03:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Almacen].[ObtenerListaPrecios] 
	
AS
BEGIN
	SET NOCOUNT ON;

		SELECT Producto.ProductoCodigo
			,Producto.ProductoDescripcion
			,ProductoPrecio.ProductoPrecioValor
			,ProductoPrecio.ProductoPrecioFecha
			,IIF(ProductoPrecio.ProductoPrecioEstado = 1, 'ACTIVO', 'INACTIVO') as ProductoPrecioEstado
		FROM Almacen.ProductoPrecio 
		INNER JOIN Almacen.Producto ON Producto.ProductoId=ProductoPrecio.ProductoId
		ORDER BY Producto.ProductoId

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'ProductoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'ProductoCodigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado (1:Activo o 0:Inactivo)' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'ProductoEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'ProductoDescripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoPrecio', @level2type=N'COLUMN',@level2name=N'ProductoPrecioId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Producto. Referencia a la tabla de producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoPrecio', @level2type=N'COLUMN',@level2name=N'ProductoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se registra el precio del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoPrecio', @level2type=N'COLUMN',@level2name=N'ProductoPrecioFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoPrecio', @level2type=N'COLUMN',@level2name=N'ProductoPrecioValor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado (1:Activo o 0:Inactivo)' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoPrecio', @level2type=N'COLUMN',@level2name=N'ProductoPrecioEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoStock', @level2type=N'COLUMN',@level2name=N'ProductoStockId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Producto. Referencia a la tabla de producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoStock', @level2type=N'COLUMN',@level2name=N'ProductoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoStock', @level2type=N'COLUMN',@level2name=N'ProductoStockCantidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado (1:Activo o 0:Inactivo)' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoStock', @level2type=N'COLUMN',@level2name=N'ProductoStockEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se registra el stock del producto' , @level0type=N'SCHEMA',@level0name=N'Almacen', @level1type=N'TABLE',@level1name=N'ProductoStock', @level2type=N'COLUMN',@level2name=N'ProductoStockFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'ClienteId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de documento del cliente' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'ClienteDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o razón social del cliente' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'ClienteRazonSocial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Edad del cliente' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'Edad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'FacturaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de la factura' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'FacturaNumero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la factura' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'FacturaFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se registra la factura' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'FacturaFechaRegistro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del cliente. Referencia a la tabla Cliente.' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'ClienteId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del estado de la factura. Referencia a la tabla de FacturaEstado' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'FacturaEstadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'FacturaDetalleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de la factura. Referencia a la tabla de factura.' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'FacturaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del producto. Referencia a la tabla de Producto' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'ProductoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad del producto en la compra' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'FacturaDetalleCantidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del detalle de la factura.' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'FacturaDetalleEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaEstado', @level2type=N'COLUMN',@level2name=N'FacturaEstadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del estado' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaEstado', @level2type=N'COLUMN',@level2name=N'FacturaEstadoDescripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado (1:Activo o 0:Inactivo)' , @level0type=N'SCHEMA',@level0name=N'Financiera', @level1type=N'TABLE',@level1name=N'FacturaEstado', @level2type=N'COLUMN',@level2name=N'FacturaEstadoEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Tabla' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UsuarioId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de documento del usuario' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UsuarioDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del usuario' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UsuarioNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido del usuario' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UsuarioApellido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del usuario' , @level0type=N'SCHEMA',@level0name=N'Seguridad', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UsuarioEstado'
GO
