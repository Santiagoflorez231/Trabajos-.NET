import 'package:flutter/material.dart';

class ConocimientosGenerales extends StatelessWidget {
  const ConocimientosGenerales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Conocimientos Generales'),
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
                    'Habilidades Técnicas',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSkillCard('Flutter', Icons.phone_android, 0.2),
                  const SizedBox(height: 20),
                  _buildSkillCard('Java', Icons.code, 0.3),
                  const SizedBox(height: 20),
                  _buildSkillCard('JavaScript', Icons.web, 0.4),
                  const SizedBox(height: 20),
                  _buildSkillCard('SQL', Icons.storage, 0.6),
                  const SizedBox(height: 40),
                  const Text(
                    'Habilidades Blandas',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSkillCard('Comunicación', Icons.people, 0.9),
                  const SizedBox(height: 20),
                  _buildSkillCard('Trabajo en equipo', Icons.group, 0.85),
                  const SizedBox(height: 20),
                  _buildSkillCard('Adaptabilidad', Icons.sync_alt, 0.8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(String skill, IconData icon, double level) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: level,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                minHeight: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
