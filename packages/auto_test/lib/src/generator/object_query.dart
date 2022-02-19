import 'argument_query.dart';

abstract class ObjectQuery {
  Type get type;

  static ObjectQuery fromParameter(parameter) {
    return ArgumentQuery(parameter);
  }
}
