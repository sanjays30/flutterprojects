import 'package:dartproject/dartproject.dart';

import 'package:test/test.dart';
// A single test file can be run just using "pub run test ./test/status_test.dart"
//Many tests can be run at a time using "pub run test ./test".
//the test runner considers any file that ends with _test.dart to be a test file

//It's also possible to run a test on the Dart VM only by invoking it using dart path/to/test.dart, 
//but this doesn't load the full test runner and will be missing some features.
void main() {
  //single test
  test('Shipping status ToString test', () {
    expect(StatusUtil.statusToString(Status.SHIPPED), "SHIPPED");
  });
  //Group of tests with one setup
  group('A group of tests for Status enum', () {
    setUp(() {
      //No setup needed
    });

    test('New status ToString test', () {
      expect(StatusUtil.statusToString(Status.NEW), "NEW");
    });
    test('DELIVERED status ToString test', () {
      expect(StatusUtil.statusToString(Status.DELIVERED), "DELIVERED");
    });
    test('Value of DELIVERED status test', () {
      expect(StatusUtil.valueOf("DELIVERED"), Status.DELIVERED);
    });
  });
  //Any matchers from the matcher package can be used with expect() to do complex validations:
}
