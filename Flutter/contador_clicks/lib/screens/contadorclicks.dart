import 'package:flutter/material.dart';

class Contadorclicks extends StatelessWidget {
  const Contadorclicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contador clicks", style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(218, 35, 73, 130),
          leading: const Icon(Icons.air_sharp, color: Colors.amber, size: 30),
        ),
        body: const Center(child: Text("Numero Clicks mamahuevo zorra puta vagabunda nacido por el culo especial de mierda usted le pone center a los colores setentahijueputa",style: TextStyle(fontSize: 20))),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_alarm_rounded),
          onPressed: (){}),
    );
  }
}