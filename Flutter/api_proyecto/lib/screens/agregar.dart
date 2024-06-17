import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgregarInsumo extends StatefulWidget {
  @override
  _AgregarInsumoState createState() => _AgregarInsumoState();
}

class _AgregarInsumoState extends State<AgregarInsumo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _medidaController = TextEditingController();
  bool _estado = true;

  Future<void> _addInsumo() async {
    final String descripcion = _descripcionController.text;
    final double precio = double.parse(_precioController.text);
    final int medida = int.parse(_medidaController.text);
    final bool estado = _estado;

    final response = await http.post(
      Uri.parse('http://santiagoflorez23-001-site1.ctempurl.com/api/Insumo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Descripcion': descripcion,
        'Precio': precio,
        'Medida': medida,
        'Estado': estado,
      }),
    );

    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      throw Exception('Falló al agregar el insumo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Insumo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un precio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _medidaController,
                decoration: InputDecoration(labelText: 'Medida'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una medida';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: Text('Estado'),
                value: _estado,
                onChanged: (bool value) {
                  setState(() {
                    _estado = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addInsumo();
                  }
                },
                child: Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
