main(List<String> args) {
  num quantity = 1;
  print(quantity.runtimeType);
  quantity = 2.0;
  print(quantity.runtimeType);
  num price = num.parse("2");
  print(price.runtimeType);
  price = num.parse("2.0");
  print(price.runtimeType);
}
