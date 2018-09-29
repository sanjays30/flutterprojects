import 'package:meta/meta.dart';

main(List<String> args) {
  Order order = new Order('Headphone', 4);
  try {
    order.finalPrice = 9.0;
  } catch (e) {
    print(e.toString());
  }
}

class Order {
  var itemName;
  int quantity;
  double price = 10.0;
  double discount=20.0;
  bool expediteShipping=false;
  DateTime orderDate = DateTime.now();

  double get finalPrice {
    return price * (100 - discount) / 100;
  }

  set finalPrice(double pricenew) {
    if (pricenew > price) throw new Exception("Price cannot exceed ${price}");
    discount = (price-pricenew) * 100 / pricenew;
    print(discount.toStringAsFixed(2));
  }

  Order(this.itemName, [this.quantity]) : super() {}
  Order.withName({@required this.itemName, this.quantity, this.price}) {}

  @override
  String toString() {
    return itemName;
  }
}
