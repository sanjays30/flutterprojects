/// doc comment
main(List<String> arguments) {
  //const and final
  const Customer customer = Customer("id", "test@test.com");
  //customerConst = Customer("id2", "test2@test.com");

  final customer2 = Customer("id", "test@test.com");
  //cannot assign another custome to this variable sinc this is final
  //customer2 =  Customer("id2", "test2@test.com");
 
  final order = Order("uid", "NEW");
  var initialStatus = order.status;
  //However I can change the properties of the object
  order.status = "test2@email.com";

  print(' Initial Order Status ${initialStatus} and current status ${order.status}');
}

//The class needs to have only final fields
//Can't define a const constructor for a class with non-final fields.

class Customer {
  final String id;
  final String email;
  const Customer(this.id, this.email);
}

class Order {
  final String id;
  String status;
  Order(this.id, this.status);
}
