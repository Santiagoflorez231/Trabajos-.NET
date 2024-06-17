//https://www.datos.gov.co/resource/vcjz-niiq.json

import 'package:api_proyecto/models/insumos.dart';
import 'package:api_proyecto/screens/agregar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListarInsumos extends StatefulWidget {
  const ListarInsumos({super.key});

  @override
  State<ListarInsumos> createState() => _ListarInsumosState();
}

Future<List<Insumo>> fetchInsumos() async {
    final response = await http
        .get(Uri.parse('http://santiagoflorez23-001-site1.ctempurl.com/api/Insumo'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((insumo) => Insumo.fromJson(insumo))
          .toList();
    } else {
      throw Exception('Falló en la carga de la API');
    }
  }

class _ListarInsumosState extends State<ListarInsumos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Insumos'),
      ),
      body: FutureBuilder<List<Insumo>>(
        future: fetchInsumos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron Insumos'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var insumo = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      insumo.estado ? Icons.check_circle : Icons.cancel,
                      color: insumo.estado ? Colors.green : Colors.red,
                    ),
                    title: Text(insumo.descripcion),
                    subtitle: Text('\$${insumo.precio}'),
                    trailing: Text('${insumo.medida} UND'),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgregarInsumo()),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}