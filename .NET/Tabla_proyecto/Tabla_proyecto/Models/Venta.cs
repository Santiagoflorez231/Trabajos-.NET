namespace Tabla_proyecto.Models
{
    public class Venta
    {
        public int Id { get; set; }
        public DateTime fecha { get; set; }
        public bool estado { get; set; }
        public string Cliente { get; set; }
        public string Metodo_pago { get; set;}
        public double Pago {get; set;}


    }
}
