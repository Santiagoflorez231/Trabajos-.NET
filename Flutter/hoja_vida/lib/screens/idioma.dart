import 'package:flutter/material.dart';

class Idiomas extends StatelessWidget {
  const Idiomas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        title: const Text('Idiomas'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Idiomas',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildLanguageCard('Español', Icons.language, 1.0, 'Nativo'),
                  const SizedBox(height: 20),
                  _buildLanguageCard('Inglés', Icons.language, 0.7, 'Avanzado'),
                  const SizedBox(height: 20),
                  _buildLanguageCard('Francés', Icons.language, 0.3, 'En aprendizaje'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(String language, IconData icon, double level, String proficiency) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: level,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  minHeight: 10,
                ),
                const SizedBox(height: 5),
                Text(
                  proficiency,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
