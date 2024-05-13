using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Components;
using API_SEGUNDO.Data;
using API_SEGUNDO.Models;
using Microsoft.EntityFrameworkCore;

namespace API_SEGUNDO.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route("api/[controller]")]
    [ApiController]
    public class VehiculoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public VehiculoController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vehiculo>>> GetVehiculos()
        { return await _context.Vehiculos.ToListAsync();
        }
    }
}
