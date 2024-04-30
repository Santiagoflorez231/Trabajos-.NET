class inventario {
  String nombreproducto;
  int stock;
  inventario(this.nombreproducto, this.stock);

  void comprar(int cantidad) {
    if (cantidad <= 0) {
      print("la cantidad a agregar debe ser mayor a 0.");
      return;
    }
    stock += cantidad;
    print(
        "se a agregado un stock de $cantidad al producto $nombreproducto. stock actual: $stock");
  }
  void vender(int cantidad) {
    if (stock <= 5) {
      print(
          "la cantidad del stock actual esta por debajo de 5, no se puede vender");
      return;
    }
    if (cantidad > stock) {
      print(
          "lo sentimos, no se puede vender $cantidad porque supera el stock actual. \n \n hay $stock elementos");
      return;
    }
    stock -= cantidad;
    print(
        "se vendieron un total de $cantidad del producto: $nombreproducto. \n stock actual $stock");
  }
}

void main() {
  var Elinventario = inventario("calzoncillo adidas", 5);
  Elinventario.comprar(15);
  Elinventario.vender(3);
  Elinventario.comprar(10);
  Elinventario.vender(70);
}
