import 'dart:math';

class Factories {
  static final _random = Random();

  static bool createBool() {
    return _random.nextBool();
  }

  static int createInt() {
    return _random.nextInt(1024);
  }

  static double createDouble() {
    return _random.nextDouble();
  }

  static Duration createDuration() {
    return Duration(milliseconds: createInt());
  }


  static DateTime createLocalDateTime() {
    final year = _random.nextInt(9999);
    final month = _random.nextInt(12) + 1;
    final day = _random.nextInt(31) + 1;
    final hour = _random.nextInt(24);
    final minutes = _random.nextInt(60);
    final seconds = _random.nextInt(60);
    final millisecond = _random.nextInt(1000);
    final microsecond = _random.nextInt(1000);
    return DateTime(
        year, month, day, hour, minutes, seconds, millisecond, microsecond);
  }

  static DateTime createDateTime() {
    return createLocalDateTime().toUtc();
  }
}
