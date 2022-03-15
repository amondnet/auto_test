const AutoTests autoTests = AutoTests();

/// A marker annotation used to instruct dart2js to keep reflection information
/// for the annotated classes.
class AutoTests {
  final String? tag;
  const AutoTests({this.tag});
}