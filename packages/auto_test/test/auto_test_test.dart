import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(TestReflectiveLoaderTest);
  }, name: 'auto_test!');
}

@autoTests
class TestReflectiveLoaderTest {
  @autoTest
  @parameterizedTest
  void testPasses(int i) {
    print(i);
    expect(true, true);
  }

  @failingTest
  void testFails() {
    expect(false, true);
  }

  void failTest() {
    expect(false, true);
  }

  @failingTest
  void fAiL() {
    expect(false, true);
  }

  @failingTest
  void testFailsThrowsSync() {
    throw 'foo';
  }

  @failingTest
  Future testFailsThrowsAsync() {
    return Future.error('foo');
  }

  @failingTest
  Future failsThrowsAsync() {
    return Future.error('foo');
  }

  @skippedTest
  void testFailsButSkipped() {
    throw 'foo';
  }

  @skippedTest
  void failsButSkipped() {
    throw 'foo';
  }

  @skippedTest
  void testTimesOutButSkipped() {
    while (true) {}
  }
}
