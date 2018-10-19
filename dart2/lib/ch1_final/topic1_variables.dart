//Built-in types
main(List<String> arguments) {
  //define a String variable
  String itemName;
  //define an Integer variable
  int quantity;
  //define a double
  double price;
  //define a boolean
  bool expediteShipping;

  //assign value to a variable
  itemName='Headphone';
  //You can use single quote or double quote for strings
  price = 22.0;
  expediteShipping = true;
  //variables know their runtime data type
  print(itemName.runtimeType);

  //all data types are classes, e.g. int is a class
  quantity = int.parse('2');

  //Concatenation of strings using +
  print(itemName + quantity.toString());

  //Concatenation of strings using variable or expression in string using $ prefix
  print('Ordered $itemName quantity $quantity at price ${price}');

  //we can write complex expressions
  print('Ordered with ${expediteShipping ? 'expediteShipping' : 'no expediteShipping'}');
}
