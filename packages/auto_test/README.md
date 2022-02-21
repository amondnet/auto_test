# auto_test

[![all_packages](https://github.com/amondnet/auto_test/actions/workflows/validate.yaml/badge.svg)](https://github.com/amondnet/auto_test/actions/workflows/validate.yaml)

Support for discovering tests and test suites using reflection.

This package follows the xUnit style where each class is a test suite, and each
method with the name prefix `test` or has `@autoTest` is a single test.

Methods with names starting with `test` or have `@autoTest` are run using the [`test()`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/test.html) function with
the corresponding name. If the class defines methods [`setUp()`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/setUp.html) or [`tearDown()`](https://pub.dev/documentation/dev_test/latest/test/tearDown.html),
they are executed before / after each test correspondingly, even if the test fails.

Methods with names starting with `soloTest` or have `@soloTest`  are run using the [`test(solo: true)`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/test.html) function.

Methods with names starting with `fail` or have `@failingTest` are expected to fail.

Methods with names starting with `soloFail` are run using the [`test(solo: true)`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/test.html) function.
and expected to fail.

Method returning `Future` class instances are asynchronous, so [`tearDown()`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/tearDown.html) is
executed after the returned `Future` completes.

Methods with names starting with `skipTest` or have `@skippedTest` are expected to skip. [`test(skip: true)`](https://pub.dev/documentation/test_core/latest/test_core.scaffolding/test.html) function.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/amondnet/auto_test/issues
