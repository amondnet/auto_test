import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(ParameterizedTextExample);
  }, name: 'ParameterizedTextExample!');
}

@autoTests
class ParameterizedTextExample {
  @parameterizedTest
  @autoSource
  void parameterizedTestInt(int a, int b) {
    Calculator sut = Calculator();
    int actual = sut.add(a, b);
    expect(a + b, actual);
  }

  @parameterizedTest
  @autoSource
  void enumTest(Month month) {
    print(month);
    expect(month, isA<Month>());
    Month.values;
  }
}

class Calculator {
  int add(int a, int b) {
    return a + b;
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