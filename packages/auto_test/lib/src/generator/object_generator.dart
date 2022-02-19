import 'object_container.dart';
import 'object_query.dart';

abstract class ObjectGenerator {
  ObjectContainer generate(ObjectQuery query, dynamic context);
}
