namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financiera.Cliente")]
    public partial class Cliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cliente()
        {
        }

        public int ClienteId { get; set; }

        public int? ClienteDocumento { get; set; }

        public string ClienteRazonSocial { get; set; }

        public int? Edad { get; set; }
    }
}
