import 'dart:async';
import 'dart:math';

import 'package:flutter_auto_test/src/annotations.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test_api/test_api.dart' as test_package;

const Test autoTest = Test();

class Test extends Reflectable {
  const Test()
      : super(metadataCapability, declarationsCapability,
            reflectedTypeCapability);
}

const ParameterizedTest parameterizedTest = ParameterizedTest();

class ParameterizedTest extends Reflectable {
  const ParameterizedTest()
      : super(metadataCapability, declarationsCapability,
            reflectedTypeCapability, typingCapability);
}

const AutoSource autoSource = AutoSource();

class AutoSource extends Reflectable {
  const AutoSource()
      : super(
          metadataCapability,
          declarationsCapability,
          reflectedTypeCapability,
        );
}

class ValueSource {
  final List<int>? ints;
  final List<String>? strings;
  final List<double>? doubles;

  const ValueSource({
    this.ints,
    this.strings,
    this.doubles,
  });
}

/// A marker annotation used to annotate test methods which are expected to fail
/// when asserts are enabled.
const _AssertFailingTest assertFailingTest = _AssertFailingTest();

/// A marker annotation used to annotate test methods which are expected to fail.
const FailingTest failingTest = FailingTest();

/// A marker annotation used to annotate test methods that should be skipped.
const SkippedTest skippedTest = SkippedTest();

/// A marker annotation used to annotate "solo" groups and tests.
/// @Deprecated('Dev only')
const _SoloTest soloTest = _SoloTest();

final List<_Group> _currentGroups = <_Group>[];
int _currentSuiteLevel = 0;
String _currentSuiteName = '';

/// Is `true` the application is running in the checked mode.
final bool _isCheckedMode = () {
  try {
    assert(false);
    return false;
  } catch (_) {
    return true;
  }
}();

/// Run the [define] function parameter that calls [defineAutoSuite] to
/// add normal and "solo" tests, and also calls [defineAutoSuite] to
/// create embedded suites.  If the current suite is the top-level one, perform
/// check for "solo" groups and tests, and run all or only "solo" items.
void defineAutoSuite(void Function() define, {String name = ''}) {
  String groupName = _currentSuiteName;
  _currentSuiteLevel++;
  try {
    _currentSuiteName = _combineNames(_currentSuiteName, name);
    define();
  } finally {
    _currentSuiteName = groupName;
    _currentSuiteLevel--;
  }
  _addTestsIfTopLevelSuite();
}

/// Runs test methods existing in the given [type].
///
/// If there is a "solo" test method in the top-level suite, only "solo" methods
/// are run.
///
/// If there is a "solo" test type, only its test methods are run.
///
/// Otherwise all tests methods of all test types are run.
///
/// Each method is run with a new instance of [type].
/// So, [type] should have a default constructor.
///
/// If [type] declares method `setUp`, it methods will be invoked before any test
/// method invocation.
///
/// If [type] declares method `tearDown`, it will be invoked after any test
/// method invocation. If method returns [Future] to test some asynchronous
/// behavior, then `tearDown` will be invoked in `Future.complete`.
void defineAutoTests(Type type) {
  ClassMirror classMirror = autoTests.reflectType(type) as ClassMirror;

  _Group group;
  {
    bool isSolo = _hasAnnotationInstance(classMirror, soloTest);
    String className = classMirror.simpleName;
    group = _Group(isSolo, _combineNames(_currentSuiteName, className));
    _currentGroups.add(group);
  }

  classMirror.instanceMembers
      .forEach((String memberName, MethodMirror memberMirror) {
    // we need only methods
    if (!memberMirror.isRegularMethod) {
      return;
    }
    // prepare information about the method
    bool isSolo = memberName.startsWith('solo') ||
        _hasAnnotationInstance(memberMirror, soloTest);

    // setUp
    if (_hasAnnotationInstance(memberMirror, beforeEach)) {
      group.addSetUp(
          (instance) => _runSetUp(instance, memberName, memberMirror));
      return;
    }

    // test
    if (memberName.startsWith('test') || _hasTestAnnotation(memberMirror)) {
      if (_hasSkippedTestAnnotation(memberMirror)) {
        group.addSkippedTest(memberName);
      } else {
        group.addTest(isSolo, memberName, memberMirror, () {
          if (_hasFailingTestAnnotation(memberMirror) ||
              _isCheckedMode && _hasAssertFailingTestAnnotation(memberMirror)) {
            return _runFailingTest(classMirror, memberName);
          } else {
            return _runTest(classMirror, memberName,
                memberMirror: memberMirror, setUp: group.setUp);
          }
        });
      }
      return;
    }
    // soloTest
    if (memberName.startsWith('soloTest') ||
        memberName.startsWith('solo_test_') ||
        _hasAnnotationInstance(memberMirror, soloTest)) {
      group.addTest(true, memberName, memberMirror, () {
        return _runTest(classMirror, memberName, memberMirror: memberMirror);
      });
    }
    // failTest
    if (memberName.startsWith('fail') || memberName.startsWith('fail_')) {
      group.addTest(isSolo, memberName, memberMirror, () {
        return _runFailingTest(classMirror, memberName);
      });
    }
    // soloFail
    if (memberName.startsWith('soloFail') ||
        memberName.startsWith('solo_fail_')) {
      group.addTest(true, memberName, memberMirror, () {
        return _runFailingTest(classMirror, memberName);
      });
    }
    // skipTest
    if (memberName.startsWith('skipTest') ||
        memberName.startsWith('skip_test_')) {
      group.addSkippedTest(memberName);
    }
  });

  // Support for the case of missing enclosing [defineReflectiveSuite].
  _addTestsIfTopLevelSuite();
}

/// If the current suite is the top-level one, add tests to the `test` package.
void _addTestsIfTopLevelSuite() {
  if (_currentSuiteLevel == 0) {
    void runTests({required bool allGroups, required bool allTests}) {
      for (_Group group in _currentGroups) {
        if (allGroups || group.isSolo) {
          for (_Test test in group.tests) {
            if (allTests || test.isSolo) {
              test_package.test(test.name, test.function,
                  timeout: test.timeout, skip: test.isSkipped);
            }
          }
        }
      }
    }

    if (_currentGroups.any((g) => g.hasSoloTest)) {
      runTests(allGroups: true, allTests: false);
    } else if (_currentGroups.any((g) => g.isSolo)) {
      runTests(allGroups: false, allTests: true);
    } else {
      runTests(allGroups: true, allTests: true);
    }
    _currentGroups.clear();
  }
}

/// Return the combination of the [base] and [addition] names.
/// If any other two is `null`, then the other one is returned.
String _combineNames(String base, String addition) {
  if (base.isEmpty) {
    return addition;
  } else if (addition.isEmpty) {
    return base;
  } else {
    return '$base | $addition';
  }
}

Object? _getAnnotationInstance(DeclarationMirror declaration, Type type) {
  for (var annotation in declaration.metadata) {
    if (annotation == type) {
      return annotation;
    }
  }
  return null;
}

bool _hasAnnotationInstance(DeclarationMirror declaration, instance) =>
    declaration.metadata.any((annotation) => identical(annotation, instance));

bool _hasAssertFailingTestAnnotation(MethodMirror method) =>
    _hasAnnotationInstance(method, assertFailingTest);

bool _hasFailingTestAnnotation(MethodMirror method) =>
    _hasAnnotationInstance(method, failingTest);

bool _hasSkippedTestAnnotation(MethodMirror method) =>
    _hasAnnotationInstance(method, skippedTest);

bool _hasTestAnnotation(MethodMirror method) =>
    _hasAnnotationInstance(method, autoTest) ||
    _hasAnnotationInstance(method, parameterizedTest) ||
    _hasFailingTestAnnotation(method) ||
    _hasSkippedTestAnnotation(method);

Future<Object?> _invokeSymbolIfExists(
    InstanceMirror instanceMirror, String memberName) {
  Object? invocationResult;
  InstanceMirror? closure;
  try {
    if (instanceMirror.type.declarations.containsKey(memberName)) {
      invocationResult = instanceMirror.invoke(memberName, []);
    }
    // ignore: empty_catches
  } on NoSuchMethodError {}

  return Future.value(invocationResult);
}

/// Run a test that is expected to fail, and confirm that it fails.
///
/// This properly handles the following cases:
/// - The test fails by throwing an exception
/// - The test returns a future which completes with an error.
/// - An exception is thrown to the zone handler from a timer task.
Future<Object?>? _runFailingTest(ClassMirror classMirror, String memberName) {
  bool passed = false;
  return runZonedGuarded(() {
    // ignore: void_checks
    return Future.sync(() => _runTest(classMirror, memberName)).then<void>((_) {
      passed = true;
      test_package.fail('Test passed - expected to fail.');
    }).catchError((e) {
      // if passed, and we call fail(), rethrow this exception
      if (passed) {
        throw e;
      }
      // otherwise, an exception is not a failure for _runFailingTest
    });
  }, (e, st) {
    // if passed, and we call fail(), rethrow this exception
    if (passed) {
      throw e;
    }
    // otherwise, an exception is not a failure for _runFailingTest
  });
}

Future<Object?> _runTest(ClassMirror classMirror, String memberName,
    {Function(InstanceMirror)? setUp, MethodMirror? memberMirror}) {
  Object instance = classMirror.newInstance('', []);
  InstanceMirror instanceMirror = autoTests.reflect(instance);
  final parameters = _generateParams(memberMirror);

  return _invokeSymbolIfExists(instanceMirror, 'setUp')
      .then((_) => setUp?.call(instanceMirror))
      .then((_) => instanceMirror.invoke(memberName, parameters))
      .whenComplete(() => _invokeSymbolIfExists(instanceMirror, 'tearDown'));
}

Future<Object?> _runSetUp(InstanceMirror instanceMirror, String memberName,
    [MethodMirror? memberMirror]) async {
  final parameters = _generateParams(memberMirror);

  return instanceMirror.invoke(memberName, parameters);
}

List<dynamic> _generateParams(MethodMirror? memberMirror) {
  var parameters = [];
  if (memberMirror != null && memberMirror.parameters.isNotEmpty) {
    if (_hasAnnotationInstance(memberMirror, autoSource)) {
      // auto_source
      for (ParameterMirror element in memberMirror.parameters) {
        switch (element.reflectedType) {
          case int:
            var minValue = 0;
            var maxValue = 1024;
            final minAnnotation =
                element.metadata.where((annotation) => annotation is Min);
            if (minAnnotation.isNotEmpty) {
              final annotation = minAnnotation.first as Min;
              minValue = annotation.value;
            }
            final maxAnnotation =
                element.metadata.where((annotation) => annotation is Max);
            if (maxAnnotation.isNotEmpty) {
              final annotation = maxAnnotation.first as Max;
              maxValue = annotation.value;
            }
            //if ( element.)
            final intValue = Random().nextInt(maxValue - minValue) + minValue;
            parameters.add(intValue);
            continue;
          case double:
            parameters.add(Random().nextDouble());
            continue;
          case bool:
            parameters.add(Random().nextBool());
            continue;
        }

        if (element.type is ClassMirror && (element.type as ClassMirror).isEnum) {
          final clz = element.type as ClassMirror;
          List list = clz.invokeGetter('values') as List;
          parameters.add(list[Random().nextInt(list.length)]);
        }
      }
    }
  }
  return parameters;
}

typedef _TestFunction = dynamic Function();

/// A marker annotation used to annotate test methods which are expected to fail.
class FailingTest {
  /// Initialize this annotation with the given arguments.
  ///
  /// [issue] is a full URI describing the failure and used for tracking.
  /// [reason] is a free form textual description.
  const FailingTest({String? issue, String? reason});
}

/// A marker annotation used to annotate test methods which are skipped.
class SkippedTest {
  /// Initialize this annotation with the given arguments.
  ///
  /// [issue] is a full URI describing the failure and used for tracking.
  /// [reason] is a free form textual description.
  const SkippedTest({String? issue, String? reason});
}

/// A marker annotation used to annotate test methods with additional timeout
/// information.
class TestTimeout {
  final test_package.Timeout _timeout;

  /// Initialize this annotation with the given timeout.
  const TestTimeout(test_package.Timeout timeout) : _timeout = timeout;
}

/// A marker annotation used to annotate test methods which are expected to fail
/// when asserts are enabled.
class _AssertFailingTest {
  const _AssertFailingTest();
}

/// Information about a type based test group.
class _Group {
  final bool isSolo;
  final String name;
  final List<_Test> tests = <_Test>[];
  final List<Function(InstanceMirror)> setUps = <Function(InstanceMirror)>[];

  _Group(this.isSolo, this.name);

  bool get hasSoloTest => tests.any((test) => test.isSolo);

  void addSkippedTest(String name) {
    var fullName = _combineNames(this.name, name);
    tests.add(_Test.skipped(isSolo, fullName));
  }

  void addTest(bool isSolo, String name, MethodMirror memberMirror,
      _TestFunction function) {
    var fullName = _combineNames(this.name, name);
    var timeout =
        _getAnnotationInstance(memberMirror, TestTimeout) as TestTimeout?;
    tests.add(_Test(isSolo, fullName, function, timeout?._timeout));
  }

  /// Registers a function to be run before tests.
  ///
  /// This function will be called before each test is run. [callback] may be
  /// asynchronous; if so, it must return a [Future].
  ///
  /// If this is called within a test group, it applies only to tests in that
  /// group. [callback] will be run after any set-up callbacks in parent groups or
  /// at the top level.
  ///
  /// Each callback at the top level or in a given group will be run in the order
  /// they were declared.
  void addSetUp(dynamic Function(InstanceMirror) callback) {
    setUps.add(callback);
  }

  void addSetUpAll() {}

  void setUp(InstanceMirror instanceMirror) {
    for (var setUp in setUps) {
      setUp(instanceMirror);
    }
  }
}

/// A marker annotation used to annotate "solo" groups and tests.
class _SoloTest {
  const _SoloTest();
}

/// Information about a test.
class _Test {
  final bool isSolo;
  final String name;
  final _TestFunction function;
  final test_package.Timeout? timeout;

  final bool isSkipped;

  _Test(this.isSolo, this.name, this.function, this.timeout)
      : isSkipped = false;

  _Test.skipped(this.isSolo, this.name)
      : isSkipped = true,
        function = (() {}),
        timeout = null;
}
