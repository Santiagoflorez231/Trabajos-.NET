import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menu2/screens/mision.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  String contenido = '';

  void itemSeleccionado(index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          contenido = "este es el home";
          break;
        case 1:
          contenido = "Lista de productos";
        case 2:
          contenido = "Contacto";
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Menu 2")),
      ),
      drawer: Drawer(
        width: 300,
        elevation: 100,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 58, 51, 203)),
              child: const Text("Menu",
                  style: TextStyle(color: Colors.black38, fontSize: 23.5)),
            ),
            ListTile(
              leading: const Icon(Icons.home_max_rounded),
              title: const Text("Inicio"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context) => const Mision(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_rounded),
              title: const Text("Mision"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context) => const Mision(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_rounded),
              title: const Text("Vision"),
              hoverColor: const Color.fromARGB(255, 127, 206, 249),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Text(contenido),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_rounded), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_outlined),
              label: 'Productos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_emergency),
              label: 'Contacto',
            )
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 112, 150, 215),
          onTap: itemSeleccionado),
    );
  }
}
