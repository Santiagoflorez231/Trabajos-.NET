import 'dart:math';

import 'package:flutter/material.dart';

class Loteria extends StatefulWidget {
  const Loteria({super.key});

  @override
  State<Loteria> createState() => _LoteriaState();
}
int numero=0;
class _LoteriaState extends State<Loteria> {
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        title: const Text('Lotería'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Número de la suerte:',style: TextStyle(fontSize: 20),
            ),
           const  SizedBox(height: 10),
            Text(
              numero != 0 ? numero.toString().padLeft(3, '0') : 'Presiona el botón',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          generarNumero();
        },
      ),
    );
  }

  void generarNumero() {
    setState(() {
      var rnd = Random();
      numero = rnd.nextInt(1000);
    });
  }
}