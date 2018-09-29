main(List<String> args) {
  String itemName;
  //since we assigned null the runtime type of assigned object remains Null
  print(itemName.runtimeType);
  itemName = "Headphone";
  print(itemName.runtimeType);
  //Null is an object as well
  //Even null is an object or type Null class
  print(null.runtimeType);
  //you can even define variable of type Null, No Null pointer exception
  Null empty = null;
  print(empty.runtimeType);
}
