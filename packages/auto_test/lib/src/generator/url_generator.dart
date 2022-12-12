import 'dart:math';

class UrlGenerator {
  static const _protocols = ['http', 'https', 'ftp'];
  final Random _random = Random();

  Uri generate() {
    int index = _random.nextInt(_protocols.length);
    String protocol = _protocols[index];

    bool hasPort = _random.nextBool();

    return Uri(
        scheme: protocol,
        host: 'auto.test',
        port: hasPort ? _random.nextInt(99999) : null);
  }
}
