import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class Venta{
  final int id;
  final DateTime fecha;
  final String estado;
  final String cliente;
  final String metodoDePago;
  final double totalAPagar;


  Venta(
    {
      required this.id,
       required this.fecha,
        required this.estado, 
        required this.cliente, 
        required this.metodoDePago,
        required this.totalAPagar
    }
  );

  factory Venta.fromJson(Map<String, dynamic> json){
    return Venta(
      id: json['id'],
      fecha: json['fecha'],
      estado: json['estado'],
      cliente: json['cliente'],
      metodoDePago: json['metodoDePago'],
      totalAPagar: json['totalAPagar'],
    );
  }
}