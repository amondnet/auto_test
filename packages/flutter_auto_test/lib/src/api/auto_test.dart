import 'package:reflectable/reflectable.dart';

const AutoTests autoTests = AutoTests();

/// A marker annotation used to instruct dart2js to keep reflection information
/// for the annotated classes.
class AutoTests extends Reflectable {
  const AutoTests()
      : super(
          invokingCapability,
          metadataCapability,
      declarationsCapability);
}
