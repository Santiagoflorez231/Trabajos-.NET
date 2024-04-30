void main(){
  Vehiculo vehiculo1 = new Vehiculo("JOHN177", "VERDE FOSFORECENTE", 2011);
  print(vehiculo1);
  Carro carro2= new Carro("TYC536", "ROJO", 1990);
  Carro carro1 = new Carro("XYR234", "VERDE FOSFORECENTE", 2011);
  print(carro1);
  print(carro2);
}

class Vehiculo{
  //definicion de atributos
  String? placa;
  String? color;
  int? modelo;

  //constructor

  Vehiculo(String placa, String color, int modelo):
  this.placa=placa,
  this.color=color,
  this.modelo=modelo;


  set Placa(String placa){
    this.Placa=placa;
  }

  String? getplaca(){
    return this.placa;
  }

  set Color(String color){
    this.color=color;
  }

  String? getcolor(){
    return this.color;
  }

  set Modelo(int modelo){
  this.modelo = modelo;
  }

  int? getmodelo(){
    return this.modelo;
  }

  @override

 String toString(){
  return ("Los datos del carro son ${this.placa}, ${this.color}, ${this.modelo}");
 }
}

class Carro extends Vehiculo{
  int numeropuertas;
  Carro(String placa, String color, int modelo) : super(placa,color,modelo);

  set Numeropuertas(int numeropuertas){
    if(numeropuertas <=0 || numeropuertas >6){
      print("numero de puertas incorrecto");
    }
    this.numeropuertas=numeropuertas;
  }
  String toString(){
  return ("Los datos del carro son ${this.placa}, ${this.color}, ${this.modelo} ${this.numeropuertas}");
 }
}