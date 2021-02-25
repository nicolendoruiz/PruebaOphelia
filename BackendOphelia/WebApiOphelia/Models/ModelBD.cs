namespace WebApiOphelia.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelBD : DbContext
    {
        public ModelBD()
            : base("name=ModelBD")
        {
        }

        public virtual DbSet<Producto> Producto { get; set; }
        public virtual DbSet<ProductoPrecio> ProductoPrecio { get; set; }
        public virtual DbSet<ProductoStock> ProductoStock { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<Factura> Factura { get; set; }
        public virtual DbSet<FacturaDetalle> FacturaDetalle { get; set; }
        public virtual DbSet<FacturaEstado> FacturaEstado { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Producto>()
                .Property(e => e.ProductoDescripcion)
                .IsUnicode(false);

            modelBuilder.Entity<ProductoPrecio>()
                .Property(e => e.ProductoPrecioValor)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Factura>()
                .Property(e => e.FacturaNumero)
                .IsUnicode(false);

  
            modelBuilder.Entity<FacturaEstado>()
                .Property(e => e.FacturaEstadoDescripcion)
                .IsFixedLength();

            modelBuilder.Entity<Usuario>()
                .Property(e => e.UsuarioNombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.UsuarioApellido)
                .IsUnicode(false);

        }
    }
}
