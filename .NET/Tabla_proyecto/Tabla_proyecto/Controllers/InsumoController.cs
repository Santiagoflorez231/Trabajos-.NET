using Microsoft.AspNetCore.Mvc;
using Tabla_proyecto.Data;

namespace Tabla_proyecto.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InsumoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public InsumoController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Insumo>>> GetInsumos()
        {
            return await _context.Insumos.ToListAsync();
        }
        [HttpPost]
        public async Task<ActionResult<IEnumerable<Insumo>>> PostInsumo(Insumo insumo)
        {
            _context.Insumos.Add(insumo);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Ambiente creado", insumo);
        }
    }
}
