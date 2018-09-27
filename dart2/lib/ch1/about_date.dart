main(List<String> args) {
  aboutDateDataType();
}


void aboutDateDataType() {
  DateTime orderDate;
  DateTime shippingDate;
  orderDate = DateTime.now();
  shippingDate = orderDate.add(new Duration(days: 6));

  print(' Order Date: ${orderDate} Shipping Date ${shippingDate}');
}
