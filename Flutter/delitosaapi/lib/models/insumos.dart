import 'dart:convert';
import 'package:http/http.dart' as http;

class Insumo{
  final int id;
  final String descripcion;
  final double precio;
  final int medida;
  final bool estado;


  Insumo(
    {
      required this.id,
       required this.descripcion,
        required this.precio, 
        required this.medida, 
        required this.estado
    }
  );

  factory Insumo.fromJson(Map<String, dynamic> json){
    return Insumo(
      id: json['id'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      medida: json['medida'],
      estado: json['estado'],
    );
  }
}