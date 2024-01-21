import 'package:paipfood_package/paipfood_dependencies.dart';
import 'package:paipfood_package/src/core/models/auth_model.dart';

AuthModel auth_ = AuthModel();
Uuid _uuid = const Uuid();
bool syncReq = false;

String get uuid => _uuid.v4();

Map<String, dynamic> mapI18n = {};

const String stringEmpty = " -- ";

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
