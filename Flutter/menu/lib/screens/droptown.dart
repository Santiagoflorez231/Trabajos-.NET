import 'package:flutter/material.dart';

class Drop extends StatefulWidget {
  const Drop({super.key});

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultado = "";
  String? valueSeleccionado;
  final List<String> unidadMedida = ['M', 'KM', 'CM'];

  void multiplicacion() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double multiplicacion = largo * ancho;
      setState(() {
        resultado = (multiplicacion.toString());
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
      });
    }
  }

  void suma() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double suma = largo + ancho;
      setState(() {
        resultado = (suma.toString());
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
      });
    }
  }

  void resta() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double resta = largo - ancho;
      setState(() {
        resultado = (resta.toString());
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
      });
    }
  }

  void division() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double division = largo / ancho;
      setState(() {
        resultado = (division.toString());
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unidad de Medida"),
        leading: const Icon(Icons.rectangle_outlined),
      ),
      body: Center(
        child: SizedBox(
          width: 370,
          height: 400,
          child: Column(
            children: [
              DropdownButton<String>(
                hint: const Text("Selecciona la unidad de medida"),
                value: valueSeleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    valueSeleccionado = nuevoValor;
                  });
                },
                items: unidadMedida.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: largoController,
                decoration: const InputDecoration(
                  labelText: 'Numero 1',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 51, 176, 185),
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(color: Color.fromARGB(255, 149, 92, 196)),
              ),
              TextField(
                controller: anchoController,
                decoration: const InputDecoration(
                  labelText: 'Numero 2',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 149, 92, 196),
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(color: Colors.blueAccent),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10.0, // Espacio horizontal entre botones
                runSpacing: 10.0, // Espacio vertical entre botones
                children: [
                  ElevatedButton(
                    onPressed: suma,
                    child: const Text('Suma'),
                  ),
                  ElevatedButton(
                    onPressed: resta,
                    child: const Text('Resta'),
                  ),
                  ElevatedButton(
                    onPressed: multiplicacion,
                    child: const Text('Mult.'),
                  ),
                  ElevatedButton(
                    onPressed: division,
                    child: const Text('Dividir'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Resultado: $resultado'),
            ],
          ),
        ),
      ),
    );
  }
}
