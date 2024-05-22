import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({super.key});

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  TextEditingController productoController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  String resultado = "";
  int? descuentoSeleccionado;
  final List<int> descuentos = [5, 10, 15];

  void calcularTotal() {
    try {
      String producto = productoController.text;
      int cantidad = int.parse(cantidadController.text);
      double precio = double.parse(precioController.text);
      double descuento = descuentoSeleccionado != null ? descuentoSeleccionado! / 100 : 0;
      double total = cantidad * precio * (1 - descuento);
      setState(() {
        resultado = "Producto: $producto\nCantidad: $cantidad\nPrecio unitario: \$${precio.toStringAsFixed(2)}\nDescuento: ${descuentoSeleccionado}%\nTotal: \$${total.toStringAsFixed(2)}";
      });
    } catch (e) {
      setState(() {
        resultado = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido"),
        leading: const Icon(Icons.shopping_cart),
      ),
      body: Center(
        child: SizedBox(
          width: 370,
          height: 500,
          child: Column(
            children: [
              TextField(
                controller: productoController,
                decoration: const InputDecoration(
                  labelText: 'Digite producto',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 51, 176, 185),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLength: 20,
                style: const TextStyle(color: Color.fromARGB(255, 149, 92, 196)),
              ),
              DropdownButton<int>(
                hint: const Text("Seleccione el descuento"),
                value: descuentoSeleccionado,
                onChanged: (int? nuevoValor) {
                  setState(() {
                    descuentoSeleccionado = nuevoValor;
                  });
                },
                items: descuentos.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value%'),
                  );
                }).toList(),
              ),
              TextField(
                controller: cantidadController,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 149, 92, 196),
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(color: Colors.blueAccent),
              ),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 149, 92, 196),
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
                style: const TextStyle(color: Colors.blueAccent),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: calcularTotal,
                child: const Text('Calcular Total'),
              ),
              const SizedBox(height: 20),
              Text('Resultado:\n$resultado', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
