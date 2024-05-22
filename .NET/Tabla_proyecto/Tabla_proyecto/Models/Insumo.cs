namespace Tabla_proyecto.Models
{
    public class Insumo
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public double Precio { get; set; }
        public int Medida { get; set; }

        public bool Estado { get; set; }
    }
}
