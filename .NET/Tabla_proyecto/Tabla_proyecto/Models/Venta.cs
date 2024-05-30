namespace Tabla_proyecto.Models
{
    public class Venta
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
        public string Cliente { get; set; } // Asumiendo que esta propiedad no puede ser null
        public string MetodoDePago { get; set; }
        public decimal TotalAPagar { get; set; }

        // Constructor que inicializa todas las propiedades
        public Venta()
        {
            Fecha = DateTime.Now; // Otra opción es inicializarla con un valor predeterminado
            Estado = ""; // O inicializarlo con un valor predeterminado
            Cliente = ""; // Inicializado aquí para evitar el error CS8618
            MetodoDePago = ""; // O inicializarlo con un valor predeterminado
            TotalAPagar = 0; // O inicializarlo con un valor predeterminado
        }
    }
}
