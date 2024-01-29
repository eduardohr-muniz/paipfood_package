import 'package:paipfood_package/paipfood_dependencies.dart';
import 'package:paipfood_package/src/core/models/auth_model.dart';

AuthModel auth_ = AuthModel();
Uuid _uuid = const Uuid();
bool syncReq = false;

String get uuid => _uuid.v4();

Map<String, dynamic> mapI18n = {};

const String stringEmpty = " -- ";
