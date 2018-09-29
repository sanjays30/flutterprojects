//Your Dart code can throw and catch exceptions. Exceptions are errors indicating
//that something unexpected happened
//In contrast to Java, all of Dart’s exceptions are unchecked exceptions.
//Methods do not declare which exceptions they might throw, and you are not required to catch any exceptions.
main(List<String> args) {
  try {
    var items = [];
    items.elementAt(1);
  } catch (exception) {
    print(exception);
  }
  
  try {
    int.parse('dsdd');
  } catch (exception) {
     print(exception);
  }
  // exception can be thrown
  try {
    throw Exception("some random error");
  } catch (exception) {
     print(exception);
  }
  //even arbitrary objects can be thrown as exception
  try {
    throw ["some random error","do something"];
  } catch (exception) {
     print(exception);
  }
}
