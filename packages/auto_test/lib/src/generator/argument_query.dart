import 'package:auto_test/src/generator/object_query.dart';

class ArgumentQuery implements ObjectQuery {
  final Symbol symbol;

  ArgumentQuery(this.symbol);
  @override
  Type get type => int;
}
