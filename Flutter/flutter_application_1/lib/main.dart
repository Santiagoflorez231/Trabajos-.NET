
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  //ejecutar aplicacion
runApp(const Ejemplo2());
}
class Ejemplo2 extends StatelessWidget {
  const Ejemplo2({super.key});

  @override
  Widget build(BuildContext context) {
    int numero1=9;
    int numero2=35;
    int suma=numero1+numero2;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Text("hola guapa muak tenes $suma palos en el qlo", style: TextStyle(color: Colors.black))
    );
  }
}