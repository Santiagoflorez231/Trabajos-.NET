import 'package:flutter/material.dart';

class Parqueadero extends StatefulWidget {
  const Parqueadero({super.key});

  @override
  State<Parqueadero> createState() => _ParqueaderoState();
}

class _ParqueaderoState extends State<Parqueadero> {
   final _formKey = GlobalKey<FormState>();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _ubicacionController = TextEditingController();
   Map<int, Map<String, String>> ubicaciones = {};
   void _asignarVehiculo() {
    if (_formKey.currentState?.validate() ?? false) {
      int ubicacion = int.parse(_ubicacionController.text);

      if (ubicaciones.containsKey(ubicacion)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('La ubicación $ubicacion ya está ocupada')),
        );
      } else {
        setState(() {
          ubicaciones[ubicacion] = {
            'placa': _placaController.text,
            'cedula': _cedulaController.text,
          };
        });
        _placaController.clear();
        _cedulaController.clear();
        _ubicacionController.clear();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Vehículos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _placaController,
                decoration: const InputDecoration(labelText: 'Placa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la placa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cedulaController,
                decoration: const InputDecoration(labelText: 'Cédula'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cédula';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ubicacionController,
                decoration: const InputDecoration(labelText: 'Ubicación (1-20)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la ubicación';
                  }
                  int? ubicacion = int.tryParse(value);
                  if (ubicacion == null || ubicacion < 1 || ubicacion > 20) {
                    return 'Ingrese una ubicación válida (1-20)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _asignarVehiculo,
                child: const Text('Asignar Vehículo'),
              ),
              Expanded(
                child: ListView(
                  children: ubicaciones.entries.map((entry) {
                    return ListTile(
                      title: Text('Ubicación ${entry.key}'),
                      subtitle: Text('Placa: ${entry.value['placa']}, Cédula: ${entry.value['cedula']}'),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}