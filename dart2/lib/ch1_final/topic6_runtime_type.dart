//num is a parent for both int and double

main(List<String> args) {
  //define a num type and assign an int
  num quantity = 1;
  //check runtime type
  print(quantity.runtimeType);
  //reassign a double
  quantity = 2.0;
  //check runtime type
  print(quantity.runtimeType);

  //unseful parse methods, parse a string with int
  num price = num.parse("2");
  //check runtime type
  print(price.runtimeType);
  //parse a string with double value
  price = num.parse("2.0");
  //check type
  print(price.runtimeType);
}
