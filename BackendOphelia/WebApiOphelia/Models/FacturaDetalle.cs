namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financiera.FacturaDetalle")]
    public partial class FacturaDetalle
    {
        public int FacturaDetalleId { get; set; }

        public int? FacturaId { get; set; }

        public int? ProductoId { get; set; }

        public int? FacturaDetalleCantidad { get; set; }

        public int? ProductoPrecioId { get; set; }

        public bool? FacturaDetalleEstado { get; set; }

        public int UsuarioId { get; set; }

        public virtual Producto Producto { get; set; }

        public virtual Factura Factura { get; set; }

        public virtual Factura ProductoPrecio { get; set; }

    }
}
