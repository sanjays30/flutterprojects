import 'package:meta/meta.dart';
main(List<String> args) {
  Order order = new Order("HEADPHONE");
  Order ordername = new Order("HeadPhone",2);

  Order orderNamedConstructor =  new Order.withName(itemName: "BOB");
  print(orderNamedConstructor);
  Order orderNamedConstructor2 = new Order.withName(itemName: "bob");
  print(orderNamedConstructor2);
}

class Order{
  var itemName;
  int quantity;
  double price;
  bool expediteShipping;

  Order(this.itemName, [this.quantity]): super() {    
    print("anany1");
  }
  Order.withName({ @required this.itemName, this.quantity, this.price}) {
    print("anany2");
  }

  @override
  String toString(){
    return itemName;
  }
}
