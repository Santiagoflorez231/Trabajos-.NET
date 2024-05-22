import 'package:flutter/material.dart';

class Ejemploarray extends StatefulWidget {
  const Ejemploarray({Key? key}) : super(key: key);

  @override
  State<Ejemploarray> createState() => _EjemploarrayState();
}

final List<String> ambientes = ['701', '702', '703', '704'];

class _EjemploarrayState extends State<Ejemploarray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_alt_outlined),
        title: const Text("Listado de ambientes"),
      ),
      body: ListView.builder(
        itemCount: ambientes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(ambientes[index]),
            subtitle: Text(index.toString()),
          );
        },
      ),
    );
  }
}