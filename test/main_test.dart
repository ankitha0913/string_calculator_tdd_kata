import 'package:string_calculator_tdd_kata/main.dart';
import 'package:test/test.dart';

void main() {
  testCommaSeparated();
  testCommaAndNewLineSeparated();
  testCustomDelimiter();
  testNegativeNumbers();
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

void testCustomDelimiter() {
  group('add with custom delimiter', () {
    test('handles custom delimiter ";"', () {
      expect(add('//;\n1;2;3'), equals(6));
    });

    test('handles custom delimiter "#"', () {
      expect(add('//#\n4#5#6'), equals(15));
    });

    test('handles custom delimiter "."', () {
      expect(add('//.\n1.2.3'), equals(6));
    });

    test('handles custom delimiter "*"', () {
      expect(add('//*\n2*3*4'), equals(9));
    });

    test('handles custom delimiter "-"', () {
      expect(add('//-\n10-20-30'), equals(60));
    });

    test('custom delimiter same as default (",")', () {
      expect(add('//,\n1,2,3'), equals(6));
    });
  });
}

void testNegativeNumbers() {
  group('negative numbers handling', () {
    test('throws when a single negative number is present', () {
      expect(() => add('1,-2,3'), throwsA(predicate((e) =>
      e is Exception && e.toString() == 'Exception: negative numbers not allowed -2'
      )));
    });

    test('throws and lists all negative numbers', () {
      expect(() => add('-1,-2,3,-4'), throwsA(predicate((e) =>
      e is Exception && e.toString() == 'Exception: negative numbers not allowed -1,-2,-4'
      )));
    });

    test('negative numbers with custom delimiter', () {
      expect(() => add('//+\n10+-20+30'), throwsA(predicate((e) =>
      e is Exception && e.toString() == 'Exception: negative numbers not allowed -20'
      )));
    });
  });
}
