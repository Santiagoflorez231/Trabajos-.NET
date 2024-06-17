import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HurtoPage extends StatefulWidget {
  const HurtoPage({super.key});

  @override
  State<HurtoPage> createState() => _HurtoPageState();
}

class _HurtoPageState extends State<HurtoPage> {
  List<dynamic> allData = [];
  List<dynamic> displayedData = [];
  List<String> departamentos = [];
  List<String> municipios = [];
  String selectedTipoHurto = '';
  String selectedDepartamento = '';
  String selectedMunicipio = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url = 'https://www.datos.gov.co/resource/9vha-vh9n.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      setState(() {
        allData = data;
        populateSelects(data);
        displayData(data);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void populateSelects(List<dynamic> data) {
    final depSet = <String>{};
    for (var item in data) {
      if (item['departamento'] != null) {
        depSet.add(item['departamento']);
      }
    }
    setState(() {
      departamentos = depSet.toList()..sort();
    });
  }

  void filterMunicipios(String departamento) {
    final munSet = <String>{};
    for (var item in allData) {
      if (item['departamento'] == departamento && item['municipio'] != null) {
        munSet.add(item['municipio']);
      }
    }
    setState(() {
      municipios = munSet.toList()..sort();
    });
  }

  void displayData(List<dynamic> data) {
    final groupedData = groupData(data);
    setState(() {
      displayedData = groupedData;
    });
  }

  List<Map<String, dynamic>> groupData(List<dynamic> data) {
    final Map<String, Map<String, dynamic>> grouped = {};

    for (var item in data) {
      final key = '${item['departamento']}-${item['municipio']}';
      if (!grouped.containsKey(key)) {
        grouped[key] = {
          'departamento': item['departamento'],
          'municipio': item['municipio'],
          'cantidad': 0,
        };
      }
      grouped[key]!['cantidad'] += int.tryParse(item['cantidad'] ?? '1') ?? 1;
    }

    return grouped.values.toList();
  }

  void buscar() {
    final filteredData = allData.where((item) {
      return (selectedTipoHurto.isEmpty || item['tipo_de_hurto'] == selectedTipoHurto) &&
             (selectedDepartamento.isEmpty || item['departamento'] == selectedDepartamento) &&
             (selectedMunicipio.isEmpty || item['municipio'] == selectedMunicipio);
    }).toList();

    displayData(filteredData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Buscados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Buscar por Tipo de Hurto, Departamento y Ciudad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Tipo de Hurto'),
                    items: const [
                      DropdownMenuItem(value: '', child: Text('Seleccione Tipo de Hurto')),
                      DropdownMenuItem(value: 'HURTO AUTOMOTORES', child: Text('HURTO AUTOMOTORES')),
                      DropdownMenuItem(value: 'HURTO A PERSONAS', child: Text('HURTO A PERSONAS')),
                      DropdownMenuItem(value: 'HURTO A RESIDENCIAS', child: Text('HURTO A RESIDENCIAS')),
                      DropdownMenuItem(value: 'HURTO DE MOTOCICLETAS', child: Text('HURTO DE MOTOCICLETAS')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedTipoHurto = value ?? '';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Departamento'),
                    items: [
                      const DropdownMenuItem(value: '', child: Text('Seleccione Departamento')),
                      ...departamentos.map((dep) => DropdownMenuItem(value: dep, child: Text(dep))),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedDepartamento = value ?? '';
                        filterMunicipios(selectedDepartamento);
                        selectedMunicipio = '';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Municipio'),
                    items: [
                      const DropdownMenuItem(value: '', child: Text('Seleccione Municipio')),
                      ...municipios.map((mun) => DropdownMenuItem(value: mun, child: Text(mun))),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedMunicipio = value ?? '';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: buscar,
                  child: const Text('Buscar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: displayedData.isEmpty
                  ? const Center(child: SpinKitCircle(color: Colors.blue, size: 50.0))
                  : ListView.builder(
                      itemCount: displayedData.length,
                      itemBuilder: (context, index) {
                        final item = displayedData[index];
                        return ListTile(
                          title: Text('${item['departamento']} - ${item['municipio']}'),
                          subtitle: Text('Cantidad: ${item['cantidad']}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
