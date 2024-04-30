//ORIENTADO A OBJETOS
void main(){
  final Aprendiz aprendiz1 = new Aprendiz("1025761400","Santiago Florez Valencia", 4.0);
  print(aprendiz1);
  print(aprendiz1.getAprueba());
  print(aprendiz1.setdocumento = "1111");
  print(aprendiz1);
  final Perro perroX = new Perro();
  perroX.nombre="Bruno";
  print("El perro ${perroX.getNombre()} hace: ${perroX.emitirSonido()}");
  final Gato gatoX = new Gato();
  gatoX.nombre="sabio";
  print("El gato ${gatoX.getNombre()} dice: ${gatoX.emitirSonido()}");
  }

  class Aprendiz {
    String documento;
    String nombres; // cuando tiene el signo de pregunta "?"" el dato puede estar vacío.
    double promedio; 

  //Definir al constructor
  //Aprendiz({required String this.documento, required String this.nombres, required double this.promedio});

  Aprendiz (String documento, String nombres, double promedio):
    this.documento = documento,
    this.nombres = nombres,
    this.promedio = promedio;

    set setdocumento(String documento){
      this.documento = documento;
    }

    set setnombres(String nombres){
      this.nombres = nombres;
    }

    set setpromedio(double promedio){
      this.promedio = promedio;
    }

    String? getNombre(){
      return this.nombres;
    }
  String getDocumento(){
      return this.documento;
    }

    String getAprueba(){

      if ( this.promedio > 3.499){
        return "Aprueba";
      }
      else {
        return "No aprueba";
      }
    }

    @override
    String toString(){
      return "${this.documento} ${this.nombres} ${this.promedio}";
    }

  }




  abstract class Animal{
    int? patas;
    void emitirSonido();
  }

  class Perro implements Animal{
   int? patas;
   String? nombre;
    set setnombre(String nombre){
      this.nombre = nombre;
    }
    String? getNombre(){
      return this.nombre;
    }

   String emitirSonido(){
    return("Guau modafoka");
   }
  }



   class Gato implements Animal{
   int? patas;
   String? nombre;
    set setnombre(String nombre){
      this.nombre = nombre;
    }
    String? getNombre(){
      return this.nombre;
    }
   String emitirSonido(){
     return ("Maten a los popetas");
   }
   
  }

//Taller crear un programa en Dart orientado a objetos que permíta calcular el área y perímetro de un círculo.
//nota: NO SE PERMITEN RADIOS NEGATIVOS


// Crear una clase de su proyecto que permita mostrar un mensaje cuando se vayan a registrar, los datos es decir debe tener un método para registrar.

//t*r al cuadrado