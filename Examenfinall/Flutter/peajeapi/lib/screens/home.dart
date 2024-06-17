import 'package:flutter/material.dart';
import '../models/pago.dart';
import '../services/pago_services.dart';
import 'formulario.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Pago> _pagos = [];

  @override
  void initState() {
    super.initState();
    _fetchPagos();
  }

  Future<void> _fetchPagos() async {
    try {
      List<Pago> pagos = await PagoService.fetchPagos();
      setState(() {
        _pagos = pagos;
      });
    } catch (e) {
      print('Error fetching pagos: $e');
    }
  }

  Future<void> _deletePago(int id) async {
    try {
      await PagoService.deletePago(id);
      await _fetchPagos();
    } catch (e) {
      print('Error deleting pago: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Pagos de Peaje'),
      ),
      body: ListView.builder(
        itemCount: _pagos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pagos[index].placa),
            subtitle: Text(_pagos[index].nombrePeaje),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PagoForm(
                          pago: _pagos[index],
                          onSave: _fetchPagos,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Confirmación'),
                        content: Text('¿Estás seguro de eliminar este pago?'),
                        actions: [
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text('Eliminar'),
                            onPressed: () {
                              _deletePago(_pagos[index].id!);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PagoForm(
                onSave: _fetchPagos,
              ),
            ),
          );
        },
      ),
    );
  }
}
