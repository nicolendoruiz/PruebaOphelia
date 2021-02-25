namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Almacen.ProductoPrecio")]
    public partial class ProductoPrecio
    {
        public int ProductoPrecioId { get; set; }

        public int? ProductoId { get; set; }

        public DateTime? ProductoPrecioFecha { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? ProductoPrecioValor { get; set; }

        public bool? ProductoPrecioEstado { get; set; }

        public virtual Producto Producto { get; set; }
    }
}
