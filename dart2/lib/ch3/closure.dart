/**
 * Dart is a lexically scoped language, which means that the scope of variables 
 * is determined statically, simply by the layout of the code. 
 * You can “follow the curly braces outwards” to see if a variable is in scope.
 */

//A closure is a function object that has access to variables in its lexical scope,
//even when the function is used outside of its original scope.
//Functions can close over variables defined in surrounding scopes.
main(List<String> args) {
  // Create a function for expedited shipping
  var expeditedShipping = shippingRule(expedite: true);

  // Create a function  for regular shipping
  var regularShipping = shippingRule(expedite: false);

  print('expeditedShipping: ${expeditedShipping(DateTime.now())}');
  print('regularShipping: ${regularShipping(DateTime.now())}');
}

/// Returns a function that adds days to the
/// function's argument.
Function shippingRule({bool expedite}) {
  num days = expedite ? 2 : 5;
  DateTime calculator(DateTime date) {
    return date.add(Duration(days: days));
  }

  return calculator;
}

/// Returns a function that adds days to the
/// function's argument.
Function shippingRule2({bool expedite}) {
  num days = expedite ? 2 : 5;
  //With fat arrow
  return (DateTime date) => date.add(Duration(days: days));
}
