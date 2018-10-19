import 'package:meta/meta.dart';
main(List<String> args) {
  //Mandatory parameter
  print(new Order("DVD"));
  //Optional parameter
  print(new Order("iPhone",2));
  //Named constructor
  print(new Order.withName(itemName: "DVD"));
  //what happens to optional fields
  Order orderNamedConstructor2 = new Order.withName(itemName: "iPhone");
  print(orderNamedConstructor2);
}

class Order{
  var itemName;
  int quantity;
  double price;
  //Mandatory and Optional parameters
  Order(this.itemName, [this.quantity]): super() {    
    print(itemName);
  }
  //named constructors with required annotation
  Order.withName({ @required this.itemName, this.quantity, this.price}) {
    print(itemName);
  }

  @override
  String toString(){
    return 'itemName: ${itemName} , quantity: ${quantity}, price: ${price}';
  }
}
