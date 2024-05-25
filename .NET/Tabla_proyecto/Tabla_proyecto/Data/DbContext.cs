using Tabla_proyecto.Models;
using Microsoft.EntityFrameworkCore;
namespace Tabla_proyecto.Data
{
   
        public class ApplicationDbContext : DbContext
        {
            public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
            {
            }
            public DbSet<Venta> Ventas { get; set; }
            public DbSet<Insumo> Insumos { get; set; }

            public DbSet<Usuario> Usuarios { get; set; }
        }
    }

