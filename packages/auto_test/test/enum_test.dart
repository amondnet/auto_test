import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(EnumTest);
  }, name: 'EnumTest!');
}

@autoTests
class EnumTest {
  @parameterizedTest
  @autoSource
  void enumTest(Month month) {
    print(month);
    expect(month, isA<Month>());
  }

  @parameterizedTest
  @autoSource
  void enumTest2(Month month, Month month2) {
    expect(month, isA<Month>());
    expect(month2, isA<Month>());
  }

  @parameterizedTest
  @autoSource
  void enumTest3(Month month, Day day) {
    expect(month, isA<Month>());
    expect(day, isA<Day>());
  }
}

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december
}

enum Day { sunday, monday, tuesday, wednesday, thursday, friday, saturday }
