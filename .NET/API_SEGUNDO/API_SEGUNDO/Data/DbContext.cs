using API_SEGUNDO.Models;
using Microsoft.EntityFrameworkCore;
namespace API_SEGUNDO.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        { 
        }
        public DbSet<Vehiculo> Vehiculos { get; set; }
    }
}
