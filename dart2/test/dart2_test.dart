import 'package:dart2/dart2.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    OrderService orderService;

    setUp(() {
      orderService = new OrderService();
    });
    test('calculate', () {
      expect(orderService.calculate(), 42);
    });
    test('new test', () {
      expect(orderService.calculate(), 21);
    });
  });
}
