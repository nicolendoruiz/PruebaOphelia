namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Almacen.ProductoStock")]
    public partial class ProductoStock
    {
        public int ProductoStockId { get; set; }

        public int? ProductoId { get; set; }

        public int? ProductoStockCantidad { get; set; }

        public bool? ProductoStockEstado { get; set; }

        public DateTime? ProductoStockFecha { get; set; }

        public virtual Producto Producto { get; set; }
    }
}
