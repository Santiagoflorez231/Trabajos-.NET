using Microsoft.Win32;

/*Crear un programa en C# empleando POO que permita manipular la
información de compras a través de crédito.
EL software debe contar con una clase main que debe contar con un
menú con las opciones:
Registrar el valor total de compras.
Realizar avances.
Pagar Crédito.
Consultar Cupo Crédito y Saldo por Pagar.
Consultar Total Puntos
Salir
Crear una clase llamada Crédito con los atributos necesarios y métodos
de acuerdo a los siguientes requisitos.
El cupo del crédito es de 1.000.000
Por cada venta que se realice, se debe sumar dicho valor al valor por
pagar. El saldo a pagar inicia en 0 y no podrá superar el cupo del
crédito.
El valor total de la compra a registrar no debe superar el valor que se
tiene disponible en crédito ni ser inferior o igual a 0. Cada vez que se
realiza una compra se incrementa el valor del Saldo por pagar. El valor
disponible en crédito corresponde a la diferencia entre el cupo del
crédito - el saldo por pagar.
El valor de los avances no puede ser superior al valor que se tiene
disponible del crédito ni &lt;= 0.Cada avance implica un aumento del saldo
a pagar y nunca el saldo a pagar podrá superar el cupo del crédito
Si el valor de compra es &gt;= 100000, el número de puntos que acumulará
el cliente corresponderá al 1% del valor de la venta.
El usuario puede realizar abonos al saldo a pagar, es decir pagar
créditos y este puede ser &gt; 0 y & lt;= saldo por pagar.

No se pueden realizar compras si el cupo del crédito es igual al saldo
por pagar.
Un avance es cuando el cliente solicita dinero en efectivo el cual se
resta del valor del crédito.
*/

class main
{
    static void Main()
    {
        Credito credito = new Credito(1000000);

        while (true)
        {

            int opcion = 0;
            while (true)
            {
                Console.WriteLine("**************************************************************");
                Console.WriteLine("Digite una opcion: ");
                Console.WriteLine("1. Registrar valor de las compras");
                Console.WriteLine("2. Realizar avances");
                Console.WriteLine("3. Pagar credito");
                Console.WriteLine("4. Consultar cupo Credito y valor por pagar");
                Console.WriteLine("5. Consultar puntos");
                Console.WriteLine("6. condonar deuda");
                Console.WriteLine("7. Salir");
                opcion = int.Parse(Console.ReadLine());
                switch (opcion)
                {
                    case 1:
                        Console.Write("Ingrese el valor total de compras: ");
                        double valorCompra = Convert.ToDouble(Console.ReadLine());
                        credito.RegistrarCompra(valorCompra);
                        break;
                    case 2:
                        Console.Write("Ingrese el valor del avance: ");
                        double valorAvance = Convert.ToDouble(Console.ReadLine());
                        credito.RealizarAvance(valorAvance);
                        break;
                    case 3:
                        Console.Write("Ingrese el valor a pagar: ");
                        double valorPago = Convert.ToDouble(Console.ReadLine());
                        credito.PagarCredito(valorPago);
                        break;
                    case 4:
                        Console.WriteLine("Cupo de crédito disponible: " + credito.CupoCredito);
                        Console.WriteLine("Saldo por pagar: " + credito.SaldoPagar);
                        break;
                    case 5:
                        Console.WriteLine("Total Puntos acumulados: " + credito.TotalPuntos);
                        break;
                    case 6:
                        Console.WriteLine("digite el porcentaje a condonar");
                        double valorCondonar = Convert.ToDouble(Console.ReadLine());
                        credito.Condonar(valorCondonar);
                        break;


                    case 7:
                        Environment.Exit(0);
                        break;
                }

            }
        }

    }
}

class Credito
{
    private double cupo = 1000000;
    private double saldoPagar = 0;
    private double puntos = 0;
    public double CupoCredito { get { return cupo; } }
    public double SaldoPagar { get { return saldoPagar; } }
    public double TotalPuntos { get { return puntos; } }

    public Credito(double cupoCredito)
    {
        cupo = cupoCredito;
        saldoPagar = 0;
        puntos = 0;
    }
    public void RegistrarCompra(double valorCompra)
    {
        if (valorCompra > cupo - SaldoPagar || valorCompra <= 0)
        {
            Console.WriteLine("El valor de la compra es inválido");
            return;
        }
        saldoPagar += valorCompra;
        if (valorCompra >= 100000)
        {
            puntos += valorCompra * 0.01;
        }
        else
        {
            puntos += 0;
        }
        Console.WriteLine("Compra registrada exitosamente");
    }
    public void RealizarAvance(double valorAvance)
    {
        if (valorAvance > cupo - saldoPagar || valorAvance <= 0)
        {
            Console.WriteLine("El valor del avance es inválido");
            return;
        }
        saldoPagar += valorAvance;
        Console.WriteLine("Avance realizado exitosamente");
    }
    public void PagarCredito(double valorPago)
    {
        if (valorPago <= 0 || valorPago > SaldoPagar)
        {
            Console.WriteLine("El valor a pagar es inválido");
            return;
        }
        saldoPagar -= valorPago;
        Console.WriteLine("Pago realizado exitosamente");
    }
    public void Condonar(double valorcondonar)
    {
        Console.WriteLine($"deuda actual: {saldoPagar}");
        if (valorcondonar <0 || valorcondonar >100)
        {
            Console.WriteLine("porcentaje invalido");
            return ;
        }
            saldoPagar -= saldoPagar *(valorcondonar/100);
            Console.WriteLine($"Se ha hecho el cambio. saldo debiente actual: {saldoPagar}");
    }
}







