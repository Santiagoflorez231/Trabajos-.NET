import 'package:flutter/material.dart';

class Contacto extends StatefulWidget {
  const Contacto({super.key});

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  final _formKey = GlobalKey<FormState>();
  final _nombrecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  void enviarDatos() {
    final nombre= _nombrecontroller.text;//capturar contenido en la cajad e texto
    final email = _emailcontroller.text;
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("formulario valido, pero que nombre tan feo"),
          backgroundColor: Colors.green,
         
        ),
      );
       print ("Los datos enviados son $nombre $email");
       _formKey.currentState!.reset();
       //_emailcontroller.clear(); si quiero eliminar un campo en especifico.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacto"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nombrecontroller,
                    decoration: InputDecoration(labelText: "Digitar el nombre"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Oiga sapo hpta usted no tiene nombre o que';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(labelText: "Digite su email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'esta perra no aprende. DIGITA TU HPTA EMAIL';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor, ingrese un correo electrónico válido, ni pa eso servis';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(onPressed: () {
                    enviarDatos();
                  }, child: Text("enviar"))
                ],
              )),
        ));
  }
}
