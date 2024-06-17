import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Pago {
  int? id;
  String placa;
  String nombrePeaje;
  String idCategoriaTarifa;
  DateTime fechaRegistro;
  double valor;

  Pago({
    this.id,
    required this.placa,
    required this.nombrePeaje,
    required this.idCategoriaTarifa,
    required this.fechaRegistro,
    required this.valor,
  });

  factory Pago.fromJson(Map<String, dynamic> json) {
    return Pago(
      id: json['id'],
      placa: json['placa'],
      nombrePeaje: json['nombrePeaje'],
      idCategoriaTarifa: json['idCategoriaTarifa'],
      fechaRegistro: DateTime.parse(json['fechaRegistro']),
      valor: json['valor'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placa': placa,
      'nombrePeaje': nombrePeaje,
      'idCategoriaTarifa': idCategoriaTarifa,
      'fechaRegistro': fechaRegistro.toIso8601String(),
      'valor': valor,
    };
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Pagos de Peaje',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PagosScreen(),
    );
  }
}

class PagosScreen extends StatefulWidget {
  @override
  _PagosScreenState createState() => _PagosScreenState();
}

class _PagosScreenState extends State<PagosScreen> {
  final apiBaseUrl = 'http://localhost:5182/api/Pagos'; // Reemplaza con tu URL de API
  final externalApiUrl = 'https://www.datos.gov.co/resource/7gj8-j6i3.json';

  late Pago _editedPago;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _fechaRegistroController = TextEditingController();

  List<String> _nombrePeajes = [];
  Map<String, double> _peajesValores = {};

  @override
  void initState() {
    super.initState();
    _editedPago = Pago(
      placa: '',
      nombrePeaje: '',
      idCategoriaTarifa: 'I', // Valor inicial, puedes ajustarlo según tu lógica
      fechaRegistro: DateTime.now(),
      valor: 0.0,
    );
    _fetchPeajes();
  }

  @override
  void dispose() {
    _fechaRegistroController.dispose();
    super.dispose();
  }

  Future<void> _fetchPeajes() async {
    try {
      final response = await http.get(Uri.parse(externalApiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _nombrePeajes = data.map((item) => item['peaje']).toSet().toList();
        _nombrePeajes.sort();
        _fetchPeajesValores();
      } else {
        throw Exception('Error fetching peajes');
      }
    } catch (error) {
      print('Error fetching peajes: $error');
    }
  }

  Future<void> _fetchPeajesValores() async {
    for (final peaje in _nombrePeajes) {
      try {
        final response = await http.get(Uri.parse(
            '$externalApiUrl?peaje=${Uri.encodeComponent(peaje)}&idcategoriatarifa=I'));
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          if (data.isNotEmpty) {
            _peajesValores[peaje] = double.parse(data[0]['valor']);
          }
        } else {
          throw Exception('Error fetching valor for $peaje');
        }
      } catch (error) {
        print('Error fetching valor for $peaje: $error');
      }
    }
  }

  Future<void> _savePago() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      final response = await http.post(
        Uri.parse(apiBaseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_editedPago.toJson()),
      );
      if (response.statusCode == 201) {
        _fetchPagos();
        _formKey.currentState!.reset();
        _editedPago = Pago(
          placa: '',
          nombrePeaje: '',
          idCategoriaTarifa: 'I', // Valor inicial
          fechaRegistro: DateTime.now(),
          valor: 0.0,
        );
      } else {
        throw Exception('Error saving pago');
      }
    } catch (error) {
      print('Error saving pago: $error');
    }
  }

  Future<void> _fetchPagos() async {
    try {
      final response = await http.get(Uri.parse(apiBaseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Pago> pagos =
            data.map((item) => Pago.fromJson(item)).toList();
        // Actualizar la interfaz con los nuevos pagos
      } else {
        throw Exception('Error fetching pagos');
      }
    } catch (error) {
      print('Error fetching pagos: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Pagos de Peaje'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Placa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  // Validar con expresión regular
                  if (!RegExp(r'^[A-Z]{3}\d{3}$').hasMatch(value)) {
                    return 'Ingrese una placa válida (ej. ABC123)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedPago.placa = value!;
                },
              ),
              DropdownButtonFormField(
                value: _editedPago.nombrePeaje,
                decoration: InputDecoration(labelText: 'Nombre del Peaje'),
                items: _nombrePeajes
                    .map((peaje) => DropdownMenuItem(
                          value: peaje,
                          child: Text(peaje),
                        ))
                    .toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    _editedPago.nombrePeaje = value;
                    // Autocompletar el valor del peaje según la API
                    if (_peajesValores.containsKey(value)) {
                      _editedPago.valor = _peajesValores[value]!;
                    }
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _editedPago.idCategoriaTarifa,
                decoration: InputDecoration(labelText: 'Categoría Tarifa'),
                items: [
                  'I',
                  'II',
                  'III',
                  'IV',
                  'V',
                ].map((categoria) => DropdownMenuItem(
                      value: categoria,
                      child: Text(categoria),
                    )).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    _editedPago.idCategoriaTarifa = value;
                    // Autocompletar el valor del peaje según la API solo al registrar
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fechaRegistroController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Fecha de Registro',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != _editedPago.fechaRegistro) {
                        setState(() {
                          _editedPago.fechaRegistro = picked;
                          _fechaRegistroController.text =
                              picked.toIso8601String().substring(0, 16);
                        });
                      }
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                initialValue: _editedPago.valor.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio