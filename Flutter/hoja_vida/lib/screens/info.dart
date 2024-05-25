import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Mi Tarjeta Personal'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SizedBox(
          width: 4000,
          child: Card(
            
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.teal, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/Foto.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Santiago Florez Valencia',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tecnólogo en Sistemas',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.teal),
                  const ExpansionTile(
                    leading: Icon(Icons.email, color: Colors.teal),
                    title: Text(
                      'Contacto',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.teal),
                        title: Text(
                          'santiagoflorezv23@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.teal),
                        title: Text(
                          '+57 3132281728',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.teal),
                        title: Text(
                          'Cra 16 #56 b25 int 103',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.teal),
                  const ExpansionTile(
                    leading: Icon(Icons.school, color: Colors.teal),
                    title: Text(
                      'Educación',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(Icons.school, color: Colors.teal),
                        title: Text(
                          'Tecnólogo en Sistemas - Centro de Servicios y Gestión Empresarial de la Regional Antioquia',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.teal),
                  const ExpansionTile(
                    leading: Icon(Icons.work, color: Colors.teal),
                    title: Text(
                      'Experiencia Laboral',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(Icons.work, color: Colors.teal),
                        title: Text(
                          'Desarrollador de Software - Creamy Soft',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

