main(List<String> args) {
  //variabes are automatically initialized with null
  String itemName;
  //print to check runtime type, runtime type of assigned object is Null
  print(itemName.runtimeType);
  //Assign some value 
  itemName = "Headphone";
  //check runtime type now
  print(itemName.runtimeType);
  //Null is an object as well
  print(null.runtimeType);
  //you can even define variable of type Null, No Null pointer exception
  Null empty = null;
  print(empty.runtimeType);
}
