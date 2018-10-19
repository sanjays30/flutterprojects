//collection type set
main(List<String> arguments) {
  // Set contains unordered unique list
  Set orderSet = new Set();
  //add items using cascade notation
  orderSet..add("headphone")..add("cellphone");
  print(orderSet);
  //add again  and print
  orderSet..add("headphone")..add("cellphone");
  print(orderSet);
}
