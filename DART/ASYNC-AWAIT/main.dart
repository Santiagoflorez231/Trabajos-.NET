import 'dart:ffi';

void main() async{
 final promedio = await getPromedio();
 print("el promedio es ${promedio}");
 final suma = await getSuma();
 print("la suma es ${suma}");
}
Future<int> getSuma() async{
  int suma=0;
  for(int i=0; i<100; i++){
    suma +=i;
  }
  return suma;
}

Future<int> getResta() async{
  int resta=0;
  for(int i=0; i<10000; i++){
    resta +=i;
  }
  return resta;
}

Future<double> getPromedio() async {
  double promedio = 110;
  int intento=0;
  int i = 0;
  for (int i = 0; i < 110; i++) { 
    intento += i;
  }
  promedio = promedio / intento;
  return promedio;
}