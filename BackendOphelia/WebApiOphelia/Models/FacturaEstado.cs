namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financiera.FacturaEstado")]
    public partial class FacturaEstado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FacturaEstado()
        {
        }

        public int FacturaEstadoId { get; set; }

        [StringLength(100)]
        public string FacturaEstadoDescripcion { get; set; }

        public bool? FacturaEstadoEstado { get; set; }

    }
}
