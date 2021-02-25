namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financiera.Factura")]
    public partial class Factura
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Factura()
        {
            FacturaDetalle = new HashSet<FacturaDetalle>();
        }

        public int FacturaId { get; set; }

        [StringLength(20)]
        public string FacturaNumero { get; set; }

        public DateTime? FacturaFecha { get; set; }

        public DateTime? FacturaFechaRegistro { get; set; }

        public int? ClienteId { get; set; }

        public int? FacturaEstadoId { get; set; }

        public int UsuarioId { get; set; }

        public virtual Cliente Cliente { get; set; }

        public virtual FacturaEstado FacturaEstado { get; set; }

        public virtual Usuario Usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FacturaDetalle> FacturaDetalle { get; set; }
    }
}
