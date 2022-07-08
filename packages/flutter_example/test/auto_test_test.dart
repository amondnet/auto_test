import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';
import 'simple_test.reflectable.dart';

void main() {
  initializeReflectable();
  defineAutoSuite(() => defineAutoTests(AutoTestTest));
}

@autoTests
class AutoTestTest {
  @autoTest
  void test1() {
    expect(1, 1);
  }
}
