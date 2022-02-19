import 'dart:math';

class Factories {
  static bool createBool() {
    return Random().nextBool();
  }

  static int createInt() {
    return Random().nextInt(1024);
  }
}
