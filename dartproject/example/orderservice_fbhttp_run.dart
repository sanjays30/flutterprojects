import 'package:dartproject/dartproject.dart';

main(List<String> args) {
  OrderServiceFbrtd fbrtd = OrderServiceFbrtd();
  Order order = Order(itemName: "CellPhone", price: 2.0, quantity: 10);
  fbrtd.addItem(order).then((order) {
    print(order);
  }).catchError((error) {
    print(error);
  });
 
  List<Order> orders;
  fbrtd.fetchAllItems().then((result) {
    orders = result;
    print(result);

  }).catchError((error) {
    print("Catching Error: *****");
    print(error);
  });
}
