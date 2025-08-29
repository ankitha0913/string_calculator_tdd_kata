import 'package:string_calculator_tdd_kata/main.dart';
import 'package:test/test.dart';

void main() {
  testCommaSeparated();
  testCommaAndNewLineSeparated();
}

void testCommaSeparated(){
  group('add comma separated', () {
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

void testCommaAndNewLineSeparated(){
  group('add comma and newline separated', () {
    test('handles newlines as delimiters', () {
      expect(add('1\n2'), equals(3));
    });

    test('handles mixed comma and newline delimiters', () {
      expect(add('1\n2,3'), equals(6));
    });
  });
}
