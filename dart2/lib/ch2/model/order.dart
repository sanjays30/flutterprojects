
import 'package:meta/meta.dart';

class Order {
  var itemName;
  int quantity;
  double price = 10.0;
  double discount=20.0;
  bool expediteShipping=false;
  DateTime orderDate = DateTime.now();
  DateTime shippingDate;

  Order(this.itemName, [this.quantity]) : super() {}
  Order.withName({@required this.itemName, this.quantity, this.price}) {}

  @override
  String toString() {
    return itemName;
  }
}
