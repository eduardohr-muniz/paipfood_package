import 'package:paipfood_package/src/core/models/auth_model.dart';

String? _slug;

String get slug {
  if (_slug == null) {
    assert(_slug != null, "Slug is null");
  }
  return _slug!;
}

set slug(String value) => _slug = value;

AuthModel? authModel;
