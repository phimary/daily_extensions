import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Int Extensions', () {
    test('returns all digits', () {
      expect(2022.digits, [2, 0, 2, 2]);
      expect((-12).digits, [1, 2]);
      expect(0.digits, [0]);
    });

    test('returns value in zero case', () {
      final value = 2022.ifZero(2);
      expect(value, isA<int>());
      expect(value, 2022);
      expect(0.ifZero(2022), 2022);
    });

    test('returns int which consists of the first [n] digits', () {
      expect(2022.first(2), 20);
      expect((-12).first(1), 1);
      expect(() => 2020.first(5), throwsRangeError);
    });

    test('returns int which consists of the last [n] digits', () {
      expect(2022.last(2), 22);
      expect(2022.last(3), 22);
      expect((-12).last(1), 2);
      expect(() => 2020.last(5), throwsRangeError);
    });

    test('converts to duration in days', () {
      expect(1.toDays(), const Duration(days: 1));
      expect(7.toDays(), const Duration(days: 7));
    });

    test('converts to duration in hours', () {
      expect(1.toHours(), const Duration(hours: 1));
      expect(7.toHours(), const Duration(hours: 7));
    });

    test('converts to duration in minutes', () {
      expect(1.toMinutes(), const Duration(minutes: 1));
      expect(7.toMinutes(), const Duration(minutes: 7));
    });

    test('converts to duration in seconds', () {
      expect(1.toSeconds(), const Duration(seconds: 1));
      expect(7.toSeconds(), const Duration(seconds: 7));
    });

    test('converts to duration in milliseconds', () {
      expect(1.toMilliseconds(), const Duration(milliseconds: 1));
      expect(7.toMilliseconds(), const Duration(milliseconds: 7));
    });

    test('converts to duration in microseconds', () {
      expect(1.toMicroseconds(), const Duration(microseconds: 1));
      expect(7.toMicroseconds(), const Duration(microseconds: 7));
    });
  });

  group('Double Extensions', () {
    test('returns the real part', () {
      expect(29.07.real, 29);
      expect(0.01.real, 0);
      expect(-19.89.real, -19);
    });

    test('returns the fractional part', () {
      expect(29.07.fractional, 0.07);
      expect(0.01.fractional, 0.01);
      expect(-19.89.fractional, -0.89);
      expect(0.0.fractional, 0.0);
      expect(-0.0.fractional, -0.0);
      expect(() => double.infinity.fractional, throwsArgumentError);
      expect(() => double.nan.fractional, throwsArgumentError);
    });

    test('returns value in zero case', () {
      final value = 2022.2.ifZero(2);
      expect(value, isA<double>());
      expect(value, 2022.2);
      expect(0.0.ifZero(2022.2), 2022.2);
    });

    test('returns closest double with digits precision', () {
      expect(29.07.roundUp(0), 29);
      expect(0.0155.roundUp(5), 0.0155);
      expect(-19.89.roundUp(1), -19.9);
      expect(-19.89.roundUp(0), -20);
      expect(17.89776.roundUp(4), 17.8978);
      expect(17.89776.roundUp(0), 18);
    });
  });

  group('Num Extensions', () {
    test('returns the length', () {
      expect(29.07.length, 5);
      expect((-19.89).length, 6);
      expect(2022.length, 4);
    });

    test('checks if int', () {
      expect(29.07.isInt, false);
      expect(2022.isInt, true);
      expect(20.0.isInt, true);
    });

    test('checks if double', () {
      expect(29.07.isDouble, true);
      expect(2022.isDouble, false);
      expect(20.0.isDouble, false);
    });

    test('returns value in zero case', () {
      const num zero = 0;
      const num number = 2022.2;
      final value = number.ifZero(2);
      expect(value, isA<num>());
      expect(value, 2022.2);
      expect(zero.ifZero(2022.2), 2022.2);
    });

    test('returns string with padding on the left', () {
      expect(202.padLeft(4), '0202');
      expect(2022.padLeft(4), '2022');
      expect(12345.padLeft(3), '12345');
      expect(123.45.padLeft(7, '*'), '*123.45');
    });

    test('returns string with padding on the right', () {
      expect(202.padRight(4), '2020');
      expect(2022.padRight(4), '2022');
      expect(12345.padRight(3), '12345');
      expect(123.45.padRight(7, '*'), '123.45*');
    });

    test('checks if within the given range', () {
      expect(29.07.isBetween(10, 30), isTrue);
      expect(29.07.isBetween(10, 20), isFalse);
      expect(29.07.isBetween(29.07, 30), isFalse);
      expect(
        29.07.isBetween(29.07, 30, startInclusive: true),
        isTrue,
      );
      expect(30.isBetween(29.07, 30), isFalse);
      expect(
        30.isBetween(29.07, 30, endInclusive: true),
        isTrue,
      );
      expect(
        5.isBetween(1, 10, startInclusive: true, endInclusive: true),
        isTrue,
      );
      expect(() => 2.isBetween(2, 2), throwsArgumentError);
      expect(() => 2.isBetween(5, 1), throwsArgumentError);
    });

    test('returns actual value', () {
      expect(29.07.toActual(), 29.07);
      expect((-2022).toActual(), -2022);
      expect(20.0.toActual(), 20);
    });

    test('returns zero if null', () {
      expect(null.orZero, 0);
      expect((-2022).orZero, -2022);
      expect(20.0.orZero, 20.0);
    });
  });
}
