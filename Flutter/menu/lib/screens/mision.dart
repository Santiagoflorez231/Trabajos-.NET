import 'package:flutter/material.dart';

class Mision extends StatefulWidget {
  const Mision({super.key});

  @override
  State<Mision> createState() => _MisionState();
}

class _MisionState extends State<Mision> {
  @override
  Widget build(BuildContext context) {
    return const Text("Producir productos sin pesticidas");
  }
}