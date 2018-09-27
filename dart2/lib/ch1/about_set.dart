main(List<String> arguments) {
  aboutCollectionTypesSet();
}

void aboutCollectionTypesSet() {
  // Set contains unordered unique list
  Set orderSet = new Set();

  orderSet..add("headphone")..add("cellphone");
  print(orderSet);
}
