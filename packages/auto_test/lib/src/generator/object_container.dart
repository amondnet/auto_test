class ObjectContainer {
  static final ObjectContainer empty = ObjectContainer(null);
  final Object? _value;

  ObjectContainer(this._value);

  ObjectContainer yieldIfEmpty(ObjectContainer Function() next) {
    return this == empty ? next.call() : this;
  }

  Object unwrapOrElseThrow() {
    if (this == empty) {
      throw Exception();
    } else {
      return _value!;
    }
  }
}
