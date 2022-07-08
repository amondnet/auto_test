import 'package:flutter_auto_test/flutter_auto_test.dart';
import 'package:test/test.dart';

import 'parameterized_test.reflectable.dart';

void main() {
  initializeReflectable();
  defineAutoSuite(() {
    defineAutoTests(Parameterized);
  }, name: 'ParameterizedTest!');
}

@autoTests
class Parameterized {
  @parameterizedTest
  @autoSource
  void parameterizedTestInt(int a, int b) {
    Calculator<int> sut = Calculator();
    int actual = sut.add(a, b);
    expect(a + b, actual);
  }

  @parameterizedTest
  @autoSource
  void doubleTest(double a, double b) {
    Calculator<double> sut = Calculator();
    double actual = sut.add(a, b);
    expect(a + b, actual);
  }
}

class Calculator<T extends num> {
  T add(T a, T b) {
    return (a + b) as T;
  }
}
