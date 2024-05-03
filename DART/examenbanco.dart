import 'dart:io';

class Cuenta {
  int? documento;
  String nombre;
  double saldo;
  Cuenta(this.documento, this.nombre, this.saldo);
}

void main() {
  var cuentas = <Cuenta>[];
  bool salir=false;
  while (!salir) {
    print("*****************MENU*****************");
    print("Digite una opcion");
    print("1. Registrar una cuenta");
    print("2. Consignar dinero");
    print("3. Transferir dinero");
    print("4. Retirar dinero");
    print("5 Consultar saldo");
    print("6. Salir");
    var opcion = int.tryParse(stdin.readLineSync() ?? '');
    switch (opcion) {
      case 1:
        print("Digite el documento de la persona:");
        var documento = int.tryParse(stdin.readLineSync() ?? '');
        if (cuentas.any((cuenta) => cuenta.documento == documento)) {
          print('Ya existe una cuenta registrada con ese documento.');
        } else {
          print("Digite el nombre completo del titular de la cuenta: ");
          var nombre = stdin.readLineSync() ?? '';
          cuentas.add(Cuenta(documento, nombre, 0));
          print('Cuenta registrada exitosamente.');
        }
        break;
      case 2:
        print('Ingrese el Documento de la cuenta:');
        var documentobuscar = int.tryParse(stdin.readLineSync() ?? '');
        for (int i = 0; i < cuentas.length; i++) {
          if (cuentas[i].documento == documentobuscar) {
            print('Ingrese la cantidad a consignar:');
            var cantidad = double.tryParse(stdin.readLineSync() ?? '');
            if (cantidad == null || cantidad <= 0) {
              print('Cantidad inválida.');
            } else {
              cuentas[i].saldo += cantidad;
              print(
                  'Se ha consignado \$${cantidad} a la cuenta de ${cuentas[i].nombre}. Nuevo saldo: \$${cuentas[i].saldo}');
              break;
            }
          }
        }
        break;
      case 3:
        print('Ingrese el documento de la cuenta de origen:');
  var documentoOrigen = int.tryParse(stdin.readLineSync() ?? '');
  var cuentaOrigen = cuentas.firstWhere((cuenta) => cuenta.documento == documentoOrigen, orElse: () => Cuenta(0, '', 0));
  if (cuentaOrigen.documento == 0) {
    print('La cuenta de origen no existe.');
    break;
  }
  
  print('Ingrese el documento de la cuenta de destino:');
  var documentoDestino = int.tryParse(stdin.readLineSync() ?? '');
  var cuentaDestino = cuentas.firstWhere((cuenta) => cuenta.documento == documentoDestino, orElse: () => Cuenta(0, '', 0));
  if (cuentaDestino.documento == 0) {
    print('La cuenta de destino no existe.');
    break;
  }
  
  print('Ingrese la cantidad a transferir:');
  var cantidad = double.tryParse(stdin.readLineSync() ?? '');
  if (cantidad == null || cantidad <= 0) {
    print('Cantidad inválida.');
    break;
  }
  
  if (cantidad > cuentaOrigen.saldo) {
    print('No es posible realizar la transferencia. Saldo insuficiente en la cuenta de origen.');
  } else {
    cuentaOrigen.saldo -= cantidad;
    cuentaDestino.saldo += cantidad;
    print('Se ha transferido \$${cantidad} de la cuenta de ${cuentaOrigen.nombre} a la cuenta de ${cuentaDestino.nombre}.');
    print('Nuevo saldo de ${cuentaOrigen.nombre}: \$${cuentaOrigen.saldo}. Nuevo saldo de ${cuentaDestino.nombre}: \$${cuentaDestino.saldo}');
  }
  break;
      case 4:
        print('Ingrese el documento de la cuenta:');
        var documento = int.tryParse(stdin.readLineSync() ?? '');
        var cuenta = cuentas.firstWhere((cuenta) => cuenta.documento == documento, orElse: () => Cuenta(null, '', 0));
        if (cuenta.documento == null) {
          print('La cuenta no existe.');
        } else {
          print('Ingrese la cantidad a retirar:');
          var cantidad = double.tryParse(stdin.readLineSync() ?? '');
          if (cantidad == null || cantidad <= 0 || cantidad > cuenta.saldo) {
            print('Cantidad inválida o saldo insuficiente.');
          } else {
            cuenta.saldo -= cantidad;
            print('Se ha retirado \$${cantidad} de la cuenta de ${cuenta.nombre}. Nuevo saldo: \$${cuenta.saldo}');
          }
        }
        break;
        case 5:
          print('Ingrese el documento de la cuenta:');
        var documento = int.tryParse(stdin.readLineSync() ?? '');
        var cuenta = cuentas.firstWhere((cuenta) => cuenta.documento == documento, orElse: () => Cuenta(null, '', 0));
        if (cuenta.documento == null) {
          print('La cuenta no existe.');
        } else {
          print("el saldo de la cuenta de ${cuenta.nombre} es: ${cuenta.saldo}.1");
        }
        break;
      case 6:
        print('Saliendo del programa...');
        salir = true;
        break;
      default:
        print('Opción no válida.');
    }
  }
}
