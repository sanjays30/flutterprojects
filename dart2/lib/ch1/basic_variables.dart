
//this is main function
main(List<String> arguments) {
  basicDataTypes();
  //nullDiscussion();
  //varAndConstant();
}

void varAndConstant() {
  var status = "assigned";
  const initialStatus = "new";
  print(status.runtimeType);
  print(' Initial Status ${initialStatus} and current status ${status}');
}

void nullDiscussion() {
  //Null is an object as well
  //Even null is an object or type Null class
  print(null.runtimeType);
  //you can even define variable of type Null, No Null pointer exception
  Null empty = null;
  print(empty.runtimeType);
}

void basicDataTypes() {
  var itemName;
  int quantity;
  double price;
  bool expediteShipping;

  //since we assigned null the runtime type of assigned object remains Null
  print(itemName.runtimeType);

  itemName = "headphone";
  //now we assigned it a string object value so type will be String
  print(itemName.runtimeType);
  //int is a class
  quantity = int.parse("2");

  price = 22.0;
  print(price.runtimeType);
  expediteShipping = true;

  //Concatenation of strings
  print(itemName + quantity.toString());
  //using expression in string ${var}
  print(
      'Ordered ${itemName} quantity ${quantity} at price ${price} with ${expediteShipping ? 'expediteShipping' : 'no expediteShipping'}');
}
