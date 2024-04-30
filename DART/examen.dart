import 'dart:io';

import 'POO.dart';

class Aprendiz {
  String documento;
  String nombre;
  int inasistencias;
  Aprendiz(this.documento, this.nombre, this.inasistencias);
}
void main() {
    var aprendices = <String, Aprendiz>{};
  while (true) {
    print("***********************************************************************************************");
    print("Menú:");
    print("1. Registrar inasistencias");
    print("2. Listar todas las inasistencias");
    print("3. Listar los aprendices con inasistencias superiores a 3");
    print("4. Consultar el total de inasistencias por aprendiz");
    print("5. Valor a Pagar");
    print("6. Número aleatorio");
    print("7. Salir");
    stdout.write("Ingrese una opción: ");
    var opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarInasistencias(aprendices);
        break;
      case 2:
        Listar(aprendices);
        break;
        /*
      case 3:
        listar3(aprendices);
        break;
      case 4:
        listartotal(aprendices);
        break;
      case 5:
        calcular(ventas);
        break;
      case 6:
        numaleatorio();
        break;*/
      case 7:
        print("Saliendo del programa...");
        return;
      default:
        print("Opción no válida. Inténtelo de nuevo.");
    }
  }
}


//--------------------------------------------------------------------------------------
void registrarInasistencias(Map<String, Aprendiz> aprendices) {
  print('\nRegistro de inasistencias:');

  stdout.write('Ingrese el documento del aprendiz: ');
  var documento = stdin.readLineSync()!;

  stdout.write('Ingrese el nombre completo del aprendiz: ');
  var nombre = stdin.readLineSync()!;

  if (aprendices.containsKey(documento)) {
    print("Este estudiante ya existe. /n Ingrese para actualizar inasistencias (entre 1 y 100):");
  var inasistencias = int.parse(stdin.readLineSync()!);
  if (inasistencias < 1 || inasistencias > 100) {
    print('Cantidad de inasistencias inválida. Debe estar entre 1 y 100.');
    return;
  }
    aprendices[documento]!.inasistencias += inasistencias;

  } else {
    print("ingrese las inasistencias del estudiante (entre 1 y 100):");
    var inasistencias = int.parse(stdin.readLineSync()!);
    if (inasistencias < 1 || inasistencias > 100) {
    print('Cantidad de inasistencias inválida. Debe estar entre 1 y 100.');
    return;
  }
    var nuevoAprendiz = Aprendiz(documento, nombre, inasistencias);
    aprendices[documento] = nuevoAprendiz;
  }

  print('INASISTENCIAS REGISTRADA CORRECTAMENTE.');
}
//--------------------------------------------------------------------------------------
void Listar(Map<String, Aprendiz> aprendices) {
  print("Listado de Todas las Inasistencias:");

aprendices.forEach((documento, aprendiz) {
    print('Documento: $documento, Nombre: ${aprendiz.nombre}, Inasistencias: ${aprendiz.inasistencias}');
  });
}