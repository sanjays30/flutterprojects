/**Every app must have a top-level main() function, 
which serves as the entrypoint to the app. The main() function 
returns void and has an optional List<String> parameter for arguments.
*/
/// doc comment
// regular single line comment
main(List<String> arguments) {
  String itemName="Headphone";
  int quantity;
  double price;
  bool expediteShipping;

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
