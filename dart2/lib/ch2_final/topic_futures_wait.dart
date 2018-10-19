import 'dart:async';

/**
 * Future objects appear throughout the Dart libraries, often as the object 
 * returned by an asynchronous method. When a future completes, 
 * its value is ready to use.
 */
main(List<String> args) async {
  //using future api
  print("step1");
  getItemName().then((data) {
    print('step1.then: ${data}');
  });

  print("step2");
  getQuantity().then((data) {
    print('step2.then: ${data}');
  }).catchError((error) {
    print('step2.error: ${error}');
  });
  print("step3");
  getPrice().then((data) {
    print('step3.then: ${data}');
  });
  /**
   * Before you directly use the Future API, consider using await instead. 
   * Code that uses await expressions can be easier to understand than 
   * code that uses the Future API.
   */
  //await yeilds and allows thread to run other queued up methods
  print("step1.await");
  var data = await getItemName();
  print('step1.await.then: ${data}');

  try {
    print("step2.await");
    var data2 = await getQuantity();
    print('step2.await.then: ${data2}');
  } catch (error) {
    print('step2.await.error: ${error}');
  }
  print("step3.await");
  var data3 = await getPrice();
  print('step3.await.then: ${data3}');
}

Future<String> getItemName() async {
  return 'iPad';
}

Future<int> getQuantity() async {
  throw Exception('Out of stock');
  //return 2;
}

Future<double> getPrice() async {
  return 22.0;
}
