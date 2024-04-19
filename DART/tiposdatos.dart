import 'dart:io';

void main() {
  /*
  print("Tipos de datos");
  String empresa="Sena";
  int cantidadprendices = 20;
  double temperaturapromedio = 33.3;
  bool estado = true;
  print("la empresa es ${empresa} tiene ${cantidadprendices} \n y la temperatura promedio es: ${temperaturapromedio}");

  if (estado) {
    print("Hay formacion");
  }
  else{
    print("No hay clase");
  }
  
  String? nombre = null;
  if (nombre == null) {
    print("ingrese el nombre");
  }
  else{
    print("putoo");
  }
  */

  /*
  //EJERCICIO DE LISTAS
  List<int> edades = [23, 12, 13, 312, 3, 21];
  print(edades);
  edades.add(43);
  print(edades);
  print("cantidad de elementos en la lista ${edades.length}");
  int contadormayores = 0;
  int contadormenores = 0;
  for (var i = 0; i < edades.length; i++) {
    if (edades[i] >= 18) {
      contadormayores++;
    }
    else{
      contadormenores++;
    }
  }
  print("Cantidad de personas mayores: ${contadormayores} "+"y la cantidad de menores es: ${contadormenores}");


  final masnumeros = List.generate(1000000, (int index) => index);
  print(masnumeros);
  */
  
  List<String> Mujeres = [];
  List<String> Hombres = [];
  print("Cuantas personas va a ingresar: ");
  int cantidadpersonas = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < cantidadpersonas; i++) {
    print("Escriba su nombre: ");
    String nombre = stdin.readLineSync()!;
     print("¿Es hombre o mujer? (h/m): ");
    String genero = stdin.readLineSync()!.toLowerCase();
    if (genero=="h") {
      Hombres.add(nombre);
    }
    else if (genero=="m"){
      Mujeres.add(nombre);
    }
    else{
      print("Genero no valido");
    }
  }
      print("las mujeres: $Mujeres \n \n y los hombres son: $Hombres");
}

