main(List<String> args) {
  //anonymous functions as objects with fat arrow
  Function calc = (int v1, int v2) => v1 + v2;
  print(calc(2, 3));
  //assign function to a variable
  var calcFn = multiply;
  print(calcFn(2, 3));
}

num multiply(int v1, int v2) {
  return v1 * v2;
}
