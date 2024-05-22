using Tabla_proyecto.Models;
namespace Tabla_proyecto.Data
{
   
        public class ApplicationDbContext : DbContext
        {
            public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
            {
            }
            public DbSet<Venta> Ventas { get; set; }
            public DbSet<Insumo> Insumos { get; set; }
        }
    }

