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

  @parameterizedTest
  @autoSource
  void stringTest(String a, String b) {
    expect(a, isNotNull);
  }
}

class Calculator<T extends num> {
  T add(T a, T b) {
    return (a + b) as T;
  }
}
