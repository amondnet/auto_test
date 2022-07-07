import 'package:test/test.dart';

void main() {
  var setUpCalled = false;
  var setUpCallCount = 0;
  setUp(() {
    setUpCalled = true;
    setUpCallCount++;
  });
  setUp(() {
    setUpCalled = true;
    setUpCallCount++;
  });

  tearDown(() {
    setUpCalled = false;
    setUpCallCount = 0;
  });

  test('test pass', () {
    expect(true, true);
  });

  test('should call setUp before each test', () {
    expect(setUpCalled, true);
    expect(setUpCallCount, 2);
  });
}
