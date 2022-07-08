import 'package:flutter_auto_test/flutter_auto_test.dart';
import 'package:test/test.dart';
import 'simple_test.reflectable.dart';

void main() {
  initializeReflectable();
  defineAutoSuite(() => defineAutoTests(SimpleTest));
}

@autoTests
class SimpleTest {
  @autoTest
  void test1() {
    expect(1, 1);
  }
}
