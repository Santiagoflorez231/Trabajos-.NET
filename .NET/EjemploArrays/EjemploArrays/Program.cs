// See https://aka.ms/new-console-template for more information
public class EjemploArray() { 
public static void Main()
{
        Console.WriteLine("Cuantos numeros reales desea ingresar: ");
        int cantidadnumero = Convert.ToInt32(Console.ReadLine());
        double[] numeros = new double[cantidadnumero];
    {
            for (int i = 0; i < cantidadnumero; i++)
            {
                Console.WriteLine($"Ingrese numero en el espacio {i+1}:");
                double numero=Convert.ToDouble(Console.ReadLine());
                numeros[i] = numero;
            }
            Console.WriteLine("se ha terminado de digitar los numeros.");
            Console.WriteLine("Resultado: ");
            for (int i = 0; i < numeros.Length; i++)
            {
                Console.WriteLine(numeros[i]);
            }



            Console.WriteLine("Ahora en orden descendiente");
            for (int i = 0; i < cantidadnumero -1; i++)
            {
                for (int j = i +1; j < cantidadnumero; j++)
                {
                    if (numeros[i] > numeros[j])
                    {
                        double auxiliar = numeros[i];
                        numeros[i] = numeros[j];
                        numeros[j] = auxiliar;

                    }
                }
                
            }
            foreach (double valor in numeros)
            {
                Console.WriteLine(valor);
            }
        }
}
}