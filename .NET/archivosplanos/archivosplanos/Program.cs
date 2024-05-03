// See https://aka.ms/new-console-template for more information

public class Manipulacionplanos
{
    static string archivoPath = "C:\\Users\\santiago\\Desktop\\Programacion\\trimestre 5\\Trabajos-.NET\\.NET\\planoejemplo.txt";
    public static void Main()
    {
        LeerArchivoPlano();
        InsertarDatos();
        LeerArchivoPlano();

    }
    public static void LeerArchivoPlano()
    {
        string Linea;
        try
        {
            StreamReader sr = new StreamReader(archivoPath);
            Linea=sr.ReadLine();
            int contador = 0;
            while (Linea !=null){
            Console.WriteLine(Linea.ToUpper());
            Linea = sr.ReadLine();
                contador++;
            }
            sr.Close();
            Console.ReadLine();
            Console.WriteLine($"el total de registros es: {contador}");
        }
        catch (Exception)
        {
            throw;
        }
    }
    public static void InsertarDatos()
    {
        try
        {
            Console.WriteLine("Ingrese el dato a insertar:");
            string dato = Console.ReadLine();

            using (StreamWriter sw = new StreamWriter(archivoPath, true))
            {
                sw.WriteLine(dato);
            }

            Console.WriteLine("Dato insertado correctamente.");
        }
        catch (Exception e)
        {
            throw e;
        }
    }
}

//crear metodo para solicitar datos por teclado e insertarlos
//en el archivo/escritura)
//crear etodo para que muestre un mensaje si el dato se encuentra o no en el archivo.
//crear un metodo que permita leer el nombre y luego cree un archivo con el nombre asignado