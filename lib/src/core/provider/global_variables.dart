import 'package:paipfood_package/src/core/models/auth_model.dart';

AuthModel? _auth;

Map<String, dynamic> mapI18n = {};

const String stringEmpty = " -- ";

AuthModel get auth_ {
  if (_auth == null) {
    assert(_auth != null, "Slug is null");
  }
  return _auth!;
}

set auth_(AuthModel value) => _auth = value;
