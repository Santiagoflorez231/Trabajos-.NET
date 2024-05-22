import 'package:flutter/material.dart';

class Rectangulo extends StatefulWidget {
  const Rectangulo({super.key});

  @override
  State<Rectangulo> createState() => _RectanguloState();
}

class _RectanguloState extends State<Rectangulo> {
  TextEditingController largocontroller = TextEditingController();
  TextEditingController anchocontroller = TextEditingController();
  String resultado = '';
  String? unidadSeleccionada;

  final List<String> unidadesmedida = ['M', 'CM', 'KM'];

  void calcularArea() {
    try {
      double largo = double.parse(largocontroller.text);
      double ancho = double.parse(anchocontroller.text);
      double area = largo * ancho;
      setState(() {
        resultado = area.toString();
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
      });
    }
  }

  void calcularPerimetro() {
    try {
      double largo = double.parse(largocontroller.text);
      double ancho = double.parse(anchocontroller.text);
      double perimetro = 2 * (largo + ancho);
      setState(() {
        resultado = perimetro.toString();
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
        title: const Text('Rectángulo'),
        leading: const Icon(Icons.rectangle),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            children: [
              DropdownButton<String>(
                value: unidadSeleccionada,
                items: unidadesmedida.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? nuevoValor) {
                  setState(() {
                    unidadSeleccionada = nuevoValor;
                  });
                },
                hint: const Text('Seleccione una unidad'),
              ),
              TextField(
                controller: largocontroller,
                decoration: const InputDecoration(
                  labelText: 'Largo',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 148, 29, 169),
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(color: Color.fromARGB(255, 62, 10, 80)),
              ),
              TextField(
                controller: anchocontroller,
                decoration: const InputDecoration(
                  labelText: 'Ancho',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.purple,
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(color: Color.fromARGB(255, 62, 10, 80)),
              ),
              ElevatedButton(
                onPressed: calcularArea,
                child: const Text('Calcular área'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: calcularPerimetro,
                child: const Text('Calcular perímetro'),
              ),
              const SizedBox(height: 10),
              Text('Resultado: $resultado'),
            ],
          ),
        ),
      ),
    );
  }
}
