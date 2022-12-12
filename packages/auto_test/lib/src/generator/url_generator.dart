import 'dart:math';

class UrlGenerator {
  static const _protocols = ['http', 'https', 'ftp'];

  Uri generate() {
    int index = Random().nextInt(_protocols.length);
    String protocol = _protocols[index];

    bool hasPort = Random().nextBool();


    return Uri(
      scheme: protocol,
      host: 'auto.test',
      port: hasPort ? Random().nextInt(99999) : null
    );
  }
}
