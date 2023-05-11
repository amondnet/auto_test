// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'auto_test_test.dart' as prefix1;
import 'dart:async' as prefix6;
import 'package:flutter_auto_test/src/api/auto_test.dart' as prefix0;
import 'package:flutter_auto_test/src/api/before_each.dart' as prefix3;
import 'package:flutter_auto_test/src/api/max.dart' as prefix5;
import 'package:flutter_auto_test/src/api/min.dart' as prefix4;
import 'package:flutter_auto_test/src/flutter_auto_test.dart' as prefix2;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.AutoTests(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'TestReflectiveLoaderTest',
            r'.TestReflectiveLoaderTest',
            134217735,
            0,
            const prefix0.AutoTests(),
            const <int>[
              0,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              27
            ],
            const <int>[
              28,
              29,
              30,
              31,
              32,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26
            ],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  () => b ? prefix1.TestReflectiveLoaderTest() : null
            },
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.autoTests],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(r'setupCalled', 134348805, 0,
            const prefix0.AutoTests(), -1, 1, 1, null, const []),
        r.VariableMirrorImpl(r'beforeEachCalled', 134348805, 0,
            const prefix0.AutoTests(), -1, 1, 1, null, const []),
        r.VariableMirrorImpl(r'setUpCount', 134348805, 0,
            const prefix0.AutoTests(), -1, 2, 2, null, const []),
        r.MethodMirrorImpl(r'setUp', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(
            r'testBeforeEach',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix3.beforeEach]),
        r.MethodMirrorImpl(
            r'testBeforeEach2',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix3.beforeEach]),
        r.MethodMirrorImpl(
            r'testShouldCalledBeforeEach',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.autoTest]),
        r.MethodMirrorImpl(
            r'passes',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[0],
            const prefix0.AutoTests(),
            const <Object>[prefix2.autoSource, prefix2.parameterizedTest]),
        r.MethodMirrorImpl(r'test_passes', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(
            r'testFails',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.failingTest]),
        r.MethodMirrorImpl(r'failTest', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'fail_test', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'fAiL', 1310722, 0, -1, -1, -1, null, const <int>[],
            const prefix0.AutoTests(), const <Object>[prefix2.failingTest]),
        r.MethodMirrorImpl(
            r'testFailsThrowsSync',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.failingTest]),
        r.MethodMirrorImpl(
            r'testFailsThrowsAsync',
            35651586,
            0,
            -1,
            3,
            4,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.failingTest]),
        r.MethodMirrorImpl(
            r'failsThrowsAsync',
            35651586,
            0,
            -1,
            3,
            4,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.failingTest]),
        r.MethodMirrorImpl(
            r'testFailsButSkipped',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.skippedTest]),
        r.MethodMirrorImpl(
            r'failsButSkipped',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.skippedTest]),
        r.MethodMirrorImpl(
            r'testTimesOutButSkipped',
            1310722,
            0,
            -1,
            -1,
            -1,
            null,
            const <int>[],
            const prefix0.AutoTests(),
            const <Object>[prefix2.skippedTest]),
        r.MethodMirrorImpl(r'skip_test_timeouts', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'skipTestTimeouts', 1310722, 0, -1, -1, -1, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.AutoTests(), 0, 21),
        r.ImplicitSetterMirrorImpl(const prefix0.AutoTests(), 0, 22),
        r.ImplicitGetterMirrorImpl(const prefix0.AutoTests(), 1, 23),
        r.ImplicitSetterMirrorImpl(const prefix0.AutoTests(), 1, 24),
        r.ImplicitGetterMirrorImpl(const prefix0.AutoTests(), 2, 25),
        r.ImplicitSetterMirrorImpl(const prefix0.AutoTests(), 2, 26),
        r.MethodMirrorImpl(r'', 64, 0, -1, 0, 0, null, const <int>[],
            const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'==', 2097154, -1, -1, 1, 1, null, const <int>[4],
            const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'toString', 2097154, -1, -1, 5, 5, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'noSuchMethod', 524290, -1, -1, -1, -1, null,
            const <int>[5], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'hashCode', 2097155, -1, -1, 2, 2, null,
            const <int>[], const prefix0.AutoTests(), const []),
        r.MethodMirrorImpl(r'runtimeType', 2097155, -1, -1, 6, 6, null,
            const <int>[], const prefix0.AutoTests(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'i',
            134348806,
            7,
            const prefix0.AutoTests(),
            -1,
            2,
            2,
            null,
            const <Object>[const prefix4.Min(1), const prefix5.Max(3)],
            null,
            null),
        r.ParameterMirrorImpl(r'_setupCalled', 134348902, 22,
            const prefix0.AutoTests(), -1, 1, 1, null, const [], null, null),
        r.ParameterMirrorImpl(r'_beforeEachCalled', 134348902, 24,
            const prefix0.AutoTests(), -1, 1, 1, null, const [], null, null),
        r.ParameterMirrorImpl(r'_setUpCount', 134348902, 26,
            const prefix0.AutoTests(), -1, 2, 2, null, const [], null, null),
        r.ParameterMirrorImpl(r'other', 134348806, 28,
            const prefix0.AutoTests(), -1, 7, 7, null, const [], null, null),
        r.ParameterMirrorImpl(r'invocation', 134348806, 30,
            const prefix0.AutoTests(), -1, 8, 8, null, const [], null, null)
      ],
      <Type>[
        prefix1.TestReflectiveLoaderTest,
        bool,
        int,
        const m.TypeValue<prefix6.Future<dynamic>>().type,
        prefix6.Future,
        String,
        Type,
        Object,
        Invocation
      ],
      1,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'setUp': (dynamic instance) => instance.setUp,
        r'testBeforeEach': (dynamic instance) => instance.testBeforeEach,
        r'testBeforeEach2': (dynamic instance) => instance.testBeforeEach2,
        r'testShouldCalledBeforeEach': (dynamic instance) =>
            instance.testShouldCalledBeforeEach,
        r'passes': (dynamic instance) => instance.passes,
        r'test_passes': (dynamic instance) => instance.test_passes,
        r'testFails': (dynamic instance) => instance.testFails,
        r'failTest': (dynamic instance) => instance.failTest,
        r'fail_test': (dynamic instance) => instance.fail_test,
        r'fAiL': (dynamic instance) => instance.fAiL,
        r'testFailsThrowsSync': (dynamic instance) =>
            instance.testFailsThrowsSync,
        r'testFailsThrowsAsync': (dynamic instance) =>
            instance.testFailsThrowsAsync,
        r'failsThrowsAsync': (dynamic instance) => instance.failsThrowsAsync,
        r'testFailsButSkipped': (dynamic instance) =>
            instance.testFailsButSkipped,
        r'failsButSkipped': (dynamic instance) => instance.failsButSkipped,
        r'testTimesOutButSkipped': (dynamic instance) =>
            instance.testTimesOutButSkipped,
        r'skip_test_timeouts': (dynamic instance) =>
            instance.skip_test_timeouts,
        r'skipTestTimeouts': (dynamic instance) => instance.skipTestTimeouts,
        r'setupCalled': (dynamic instance) => instance.setupCalled,
        r'beforeEachCalled': (dynamic instance) => instance.beforeEachCalled,
        r'setUpCount': (dynamic instance) => instance.setUpCount
      },
      {
        r'setupCalled=': (dynamic instance, value) =>
            instance.setupCalled = value,
        r'beforeEachCalled=': (dynamic instance, value) =>
            instance.beforeEachCalled = value,
        r'setUpCount=': (dynamic instance, value) => instance.setUpCount = value
      },
      null,
      []),
  const prefix2.Test(): r.ReflectorData(
      <m.TypeMirror>[],
      <m.DeclarationMirror>[],
      <m.ParameterMirror>[],
      <Type>[],
      0,
      {},
      {},
      null,
      []),
  const prefix2.ParameterizedTest(): r.ReflectorData(
      <m.TypeMirror>[],
      <m.DeclarationMirror>[],
      <m.ParameterMirror>[],
      <Type>[],
      0,
      {},
      {},
      <m.LibraryMirror>[],
      []),
  const prefix2.AutoSource(): r.ReflectorData(
      <m.TypeMirror>[],
      <m.DeclarationMirror>[],
      <m.ParameterMirror>[],
      <Type>[],
      0,
      {},
      {},
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
