main(List<String> args) {
   /***** Map learning section */
  //Map can hold key value pair
  Map map = new Map();
  print(map.runtimeType);
  //add an key value pair to map
  map["key"] = 1;
  print(map);
  //Interesting method to add items
  map.putIfAbsent("key2", () {
    return 2;
  });
  print(map);
  //Short cut
  map.putIfAbsent("key", () => 2);
  print(map);
  //if you really want to update
  map.update("key", (value) => value + 2);
  print(map);
}