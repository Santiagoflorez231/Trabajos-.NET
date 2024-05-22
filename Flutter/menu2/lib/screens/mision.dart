import 'package:flutter/material.dart';


class Mision extends StatefulWidget {
  const Mision({super.key});

  @override
  State<Mision> createState() => _MisionState();
}

class _MisionState extends State<Mision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mision zorra"),
      ),
      body: const Center(
        child: Card(
          color: Colors.teal,
          
          child: SizedBox(
            width: 200,
            height: 300,
            child: Text("hola soy una carta mongola"),
          ),
        ),
      )
    );
  }
}