import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:spec_cli/src/command_runner.dart';

Future<int> autoTestCommandRunner(List<String> args) async {
  final exitCode = await _AutoTestCommandRunner().run(args);
  // May return null when using -h
  return exitCode ?? 0;
}

class _AutoTestCommandRunner extends CommandRunner<int> {
  _AutoTestCommandRunner()
      : super('auto',
            'A command line for running tests on Dart/Flutter projects') {
    _setupArgParser(argParser);
  }

  static void _setupArgParser(ArgParser argParser) {
    argParser
      ..addFlag(
        'watch',
        abbr: 'w',
        negatable: false,
        help: 'Listens to changes in the project and '
            'run tests whenever something changed',
      )
      ..addFlag(
        'ci',
        defaultsTo: null,
        help: 'Changes the rendering to be more adaped to CI environments.'
            ' Default to determining the environment automatically.',
      )
      ..addFlag(
        'coverage',
        negatable: false,
        help: 'Whether to collect coverage information.',
      )
      ..addFlag(
        'report',
        negatable: false,
        help: 'Whether to report coverage information.',
      )
      ..addMultiOption(
        'name',
        abbr: 'n',
        help: 'Filters tests by name.',
      );
  }

  static SpecOptions _decodeArgs(ArgResults result) {
    return SpecOptions(
      watch: result['watch'] as bool,
      fileFilters: result.rest,
      testNameFilters: result['name'] as List<String>,
      ci: result['ci'] as bool?,
      coverage: result['coverage'] as bool,
    );
  }

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults['help'] as bool) {
      return super.runCommand(topLevelResults);
    }

    final result = await spec(options: _decodeArgs(topLevelResults));
    if (topLevelResults['report'] as bool) {
      // report
      if (File('coverage/lcov.info').existsSync()) {
        Process.run('genhtml',
            ['coverage/lcov.info', '-o', 'coverage/html', '-s', '-p']);
        final coverage = File('coverage').readAsStringSync();
        print(coverage);
      }
    }
    return result;
  }
}
