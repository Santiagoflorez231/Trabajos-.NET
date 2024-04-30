void main(){
  final Nombre="Diego";
  print("funciones");
  print(saludar(Nombre,"hoy es lunes"));
  despedir();
}

String saludar(String Nombre, [String mensaje = 'estudie']){
  return "Hola ${Nombre} ${mensaje}";
}

void despedir(){
  print("adios");
  
}