import 'dart:async';
import 'dart:io';

import 'package:auto_test_cli/src/command_runner.dart';

Future<void> main(List<String> args) async {
  final exitCode = await autoTestCommandRunner(args);

  exit(exitCode);
}
