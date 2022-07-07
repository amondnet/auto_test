import 'package:flutter_auto_test/flutter_auto_test.dart';
import 'package:test/test.dart';

import 'enum_test.reflectable.dart';

void main() {
  initializeReflectable();
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
