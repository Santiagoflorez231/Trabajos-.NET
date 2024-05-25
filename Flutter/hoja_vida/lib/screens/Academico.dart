import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Academico extends StatelessWidget {
  const Academico({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Información Académica'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        
        child: IntrinsicHeight(
          child: Container(          
            width: 4000,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 45),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color.fromARGB(255, 168, 166, 166), width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/Colegio.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Educación Formal',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tecnólogo en Sistemas - Universidad Sena',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        'Fecha de Graduación: Abril 2025',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 203, 185, 185),
                        ),
                      ),
                      Divider(height: 20, color: Colors.grey),
                      Text(
                        'Cursos Adicionales',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Curso de Desarrollo Web - Plazi',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        'Fecha de Finalización: Abril 2022',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 203, 185, 185),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
