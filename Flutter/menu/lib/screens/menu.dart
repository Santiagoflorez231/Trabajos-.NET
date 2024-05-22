import 'package:flutter/material.dart';
import 'package:menu/screens/array.dart';
import 'package:menu/screens/droptown.dart';
import 'package:menu/screens/pedido.dart';
import 'package:menu/screens/rectangulo.dart';
import 'package:menu/screens/vision.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 248, 252),
        leading: const Icon(Icons.menu_open),
        title: const Text("como dijo andrea hola gonorrea"),
      ),
      body: ListView(
        children:  [
          const ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Mision"),
            subtitle: Text("Productos de calidad"),
            trailing: Icon(Icons.navigate_next),
          ),

           ListTile(
            leading: const Icon(Icons.ac_unit_rounded),
            title: const Text("Vision"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) =>const Vision());
              Navigator.push(context,route);
            },
          ),

            const ListTile(
            leading: Icon(Icons.account_tree_outlined),
            title: Text("Productos"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon (Icons.list_alt_outlined),
            title: const Text('Listado Ambientes'),
            subtitle: const Text("Ambientes torre norte"),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => const Ejemploarray());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon (Icons.list_alt_outlined),
            title: const Text('Listado Productos'),
            subtitle: const Text("Productos de excelente calidad papa"),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => const Ejemploarray());
              Navigator.push(context, route);
            },
          ),
            ListTile( 
            leading:const Icon(Icons.rectangle_rounded),
            title:const Text("Calculadora"),
            subtitle:const Text("2 numeros pq toi chiquito"),
            trailing:const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => const Drop());
              Navigator.push(context, route);
            },
          ),
           ListTile( 
            leading:const Icon(Icons.rectangle_rounded),
            title:const Text("Area Perimetro"),
            subtitle:const Text("rectangulo"),
            trailing:const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => const Rectangulo());
              Navigator.push(context, route);
            },
          ),
           ListTile( 
            leading:const Icon(Icons.rectangle_rounded),
            title:const Text("Examen productos"),
            
            trailing:const Icon(Icons.navigate_next_outlined),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => const Pedido());
              Navigator.push(context, route);
            },
          ),

        ],
      ),
    );
  }
}