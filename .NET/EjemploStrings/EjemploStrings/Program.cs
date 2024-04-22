// See https://aka.ms/new-console-template for more information
using System; 
public class EjemploStrings
{
    public static void Main()
    {
        string frase = "Hola";
        Console.WriteLine(frase); //tamaño del string
        for (int i = 0; i < frase.Length; i++)
        {
            Console.WriteLine(frase[i]);
            Console.WriteLine("Holaaaa");
        }
    }
}