void main(){
  //Acciones que se ejecutan en un futuro
  print("Antes de la peticion");
  getNombre('1020').then((data) {
    print(data.toUpperCase());
  });
  print("Antes de la peticion 2");
  getPrecioDolar().then((data) {
    print(data.toUpperCase());
  });
}

Future<String> getNombre(String documento){
  return Future.delayed(new Duration(seconds: 7), (){
    return 'El nombre es maria';
  });
}

Future<String> getPrecioDolar(){
  return Future.delayed(new Duration(seconds: 7), (){
    return 'El precio es: 4000';
  });
}