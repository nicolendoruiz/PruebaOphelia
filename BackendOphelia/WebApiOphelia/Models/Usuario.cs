namespace WebApiOphelia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Seguridad.Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
        }

        public int UsuarioId { get; set; }

        public int? UsuarioDocumento { get; set; }

        [StringLength(100)]
        public string UsuarioNombre { get; set; }

        [StringLength(100)]
        public string UsuarioApellido { get; set; }

        public bool? UsuarioEstado { get; set; }

    }
}
