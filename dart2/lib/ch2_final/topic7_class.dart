class Order {
  var itemName;
  int quantity;
  double price = 10.0;
  double discount = 20.0;
  bool expediteShipping = false;
  DateTime orderDate = DateTime.now();
  DateTime shippingDate;

  Order(this.itemName, this.quantity){}

  @override
  String toString() {
    return itemName;
  }
}
