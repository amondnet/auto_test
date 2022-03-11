import 'package:auto_test/auto_test.dart';
import 'package:test/test.dart';

void main() {
  defineAutoSuite(() {
    defineAutoTests(TestReflectiveLoaderTest);
  }, name: 'auto_test!');
}

@autoTests
class TestReflectiveLoaderTest {
  bool setupCalled = false;
  bool beforeEachCalled = false;
  int setUpCount = 0;

  void setUp() {
    setupCalled = true;
    setUpCount++;
  }

  @beforeEach
  void testBeforeEach() {
    beforeEachCalled = true;
    setUpCount++;
  }

  @beforeEach
  void testBeforeEach2() {
    beforeEachCalled = true;
    setUpCount++;
  }

  @autoTest
  void testShouldCalledBeforeEach() {
    expect(beforeEachCalled, true);
    expect(setUpCount, 3);
  }

  @autoSource
  @parameterizedTest
  void passes(int i) {
    print(i);
    expect(true, true);
  }

  // ignore: non_constant_identifier_names
  void test_passes() {
    expect(true, true);
  }

  @failingTest
  void testFails() {
    expect(false, true);
  }

  void failTest() {
    expect(false, true);
  }

  // ignore: non_constant_identifier_names
  void fail_test() {
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

  // ignore: non_constant_identifier_names
  void skip_test_timeouts() {
    while (true) {}
  }

  void skipTestTimeouts() {
    while (true) {}
  }
}
