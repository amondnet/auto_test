import 'package:matcher/matcher.dart';
import 'package:matcher/src/feature_matcher.dart';
import 'package:test/test.dart' as test_package;
import 'package:meta/meta.dart';


AbstractAssert assertThat<Actual>(Actual value) {
  return AbstractAssert(value);
}

abstract class Assert<ACTUAL, RETURN, PARAM> {
  /// The value that is tested
  final ACTUAL actual;
  final test_package.Matcher Function(test_package.Matcher) _matcherBuilder;

  Assert(this.actual, {
    test_package.Matcher Function(test_package.Matcher)? matcherBuilder,
  }) : _matcherBuilder = matcherBuilder ?? ((matcher) => matcher);

  /// Expect that [actual] matches with a Matcher from the Dart SDK.
  @protected
  RETURN runMatcher(test_package.Matcher match);

  /// Apply transformations to a matcher.
  @protected
  test_package.Matcher createMatcher(test_package.Matcher match) {
    return _matcherBuilder(match);
  }

  /// Verifies that the actual value is equal to the given one.
  RETURN isEqualTo(Object expected) {
    return runMatcher(test_package.equals(expected));
  }

  /// Verifies that the actual value is not equal to the given one.
  RETURN isNotEqualTo(Object other) {
    return runMatcher(test_package.isNot(test_package.equals(other)));
  }

  /// Verifies that the actual value is `null`.
  RETURN isNull() {
    return runMatcher(test_package.isNull);
  }

  /// Verifies that the actual value is not `null`.
  RETURN isNotNull() {
    return runMatcher(test_package.isNotNull);
  }


}

@sealed
class AbstractAssert<ACTUAL> extends Assert<ACTUAL, void, ACTUAL> {
  AbstractAssert(ACTUAL actual, {
    test_package.Matcher Function(test_package.Matcher)? matcherBuilder,
  }) : super(actual, matcherBuilder: matcherBuilder);

  @override
  void runMatcher(Matcher match) {
    return test_package.expect(actual, createMatcher(match));
  }
}


