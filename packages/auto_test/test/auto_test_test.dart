import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';
import 'package:auto_test/auto_test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(TestReflectiveLoaderTest);
  }, name: 'auto_test!');
}

@autoTests
class TestReflectiveLoaderTest {
  @autoTest
  @parameterizedTest
  void test_passes(int i) {
    print(i);
    expect(true, true);
  }

  @failingTest
  void test_fails() {
    expect(false, true);
  }

  @failingTest
  void test_fails_throws_sync() {
    throw 'foo';
  }

  @failingTest
  Future test_fails_throws_async() {
    return new Future.error('foo');
  }

  @skippedTest
  void test_fails_but_skipped() {
    throw 'foo';
  }

  @skippedTest
  void test_times_out_but_skipped() {
    while (true) {}
  }
}
