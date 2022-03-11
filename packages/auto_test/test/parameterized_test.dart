import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(Parameterized);
  }, name: 'ParameterizedTest!');
}

@autoTests
class Parameterized {
  @parameterizedTest
  @autoSource
  void parameterizedTestInt(int a, int b) {
    Calculator sut = Calculator();
    int actual = sut.add(a, b);
    expect(a + b, actual);
  }
}

class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}
