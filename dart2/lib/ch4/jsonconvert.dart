import 'dart:convert';
import 'package:meta/meta.dart';

main(List<String> args) {
  Order order = new Order('Headphone', 4);
  String jsondata = json.encode(order);
  print(jsondata);
  Map<String, dynamic> orderMap = json.decode(jsondata);
  var orderDecoded = new Order.fromJson(orderMap);
  print(orderDecoded);
}

class Order {
  var itemName;
  int quantity;
  double price;
  bool expediteShipping;

  Order(this.itemName, [this.quantity]) : super() {}
  Order.withName({@required this.itemName, this.quantity, this.price}) {}

  @override
  String toString() {
    return itemName;
  }

  Order.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    quantity = json['quantity'];
  }
  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'quantity': quantity,
    };
  }
}
