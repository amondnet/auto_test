import 'package:auto_test/src/generator/object_generator.dart';

class IntGenerator implements ObjectGenerator {
  @override
  generate(query, context) {
    final type = query.type;

    if (type == int) {}

    // TODO: implement generate
    throw UnimplementedError();
  }
}
