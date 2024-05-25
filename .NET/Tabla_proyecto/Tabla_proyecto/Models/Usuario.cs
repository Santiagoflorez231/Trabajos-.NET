namespace Tabla_proyecto.Models
{
    public class Usuario
    {
        [Key]   
        public int Id { get; set; }
        [Required]
        public string Nombre { get; set; }

        [Required]
        public double Documento { get; set; }

        [Required]
        public double Telefono { get; set;}

        [Required]
        public string Password { get; set; }

    }
}
