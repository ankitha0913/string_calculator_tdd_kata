import 'package:string_calculator_tdd_kata/main.dart';
import 'package:test/test.dart';

void main() {
  group('add', () {
    test('returns 0 when the string is empty', () {
      expect(add(''), equals(0));
    });

    test('returns the number when there is only one number', () {
      expect(add('5'), equals(5));
    });

    test('returns the sum of two numbers', () {
      expect(add('1,2'), equals(3));
    });

    test('returns the sum of multiple numbers', () {
      expect(add('1,2,3,4'), equals(10));
    });
  });
}
