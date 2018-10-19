main(List<String> args) {
  //define date variable
  DateTime orderDate;
  //assignn value of current datetime
  orderDate = DateTime.now();

  //define another date
  DateTime shippingDate;

  //assign new date which is 6 days after first date
  shippingDate = orderDate.add(new Duration(days: 6));

  //print both dates
  print('Order Date: ${orderDate.toString()} Shipping Date ${shippingDate.toIso8601String()}');
}
