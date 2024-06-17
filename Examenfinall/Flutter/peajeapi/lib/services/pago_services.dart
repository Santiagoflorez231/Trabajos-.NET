import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pago.dart';

class PagoService {
  static const String apiUrl = 'http://localhost:5182/api/Pagos';

  static Future<List<Pago>> fetchPagos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Pago.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching pagos');
    }
  }

  static Future<void> savePago(Pago pago) async {
    final url = pago.id != null ? '$apiUrl/${pago.id}' : apiUrl;
    final method = pago.id != null ? 'PUT' : 'POST';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(pago.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to save pago');
    }
  }

  static Future<void> deletePago(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete pago');
    }
  }
}