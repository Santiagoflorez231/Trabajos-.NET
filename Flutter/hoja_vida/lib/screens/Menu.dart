import 'package:flutter/material.dart';
import 'package:hoja_vida/screens/Academico.dart';
import 'package:hoja_vida/screens/conocimiento.dart';
import 'package:hoja_vida/screens/idioma.dart';
import 'package:hoja_vida/screens/info.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: const Text("Menú Principal"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: Drawer(
        semanticLabel: 'Holaaaaa',
        backgroundColor: const Color(0xFF1E1E1E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/Foto.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Santiago Florez Valencia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tecnólogo en Sistemas',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            _createDrawerItem(
              icon: Icons.home,
              text: 'Información Personal',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Info()),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.school,
              text: 'Información Académica',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Academico()),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.code,
              text: 'Conocimientos Técnicos',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConocimientosGenerales()));
              },
            ),
            _createDrawerItem(
              icon: Icons.language,
              text: 'Idiomas',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Idiomas()));
              },
            ),
            _createDrawerItem(
              icon: Icons.personal_injury_outlined,
              text: 'Proyectos',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Selecciona una opción del menú...',
          style: TextStyle(
              color: Color.fromARGB(179, 255, 255, 255), fontSize: 18),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
      hoverColor: Colors.teal.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
