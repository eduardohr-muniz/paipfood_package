import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class PreferencesModel {
  final int? establishmentId;
  final bool? isDarkMode;
  final String? languageCode;
  final String? countryCode;
  final AuthModel? authModel;

  PreferencesModel({
    this.establishmentId,
    this.isDarkMode,
    this.languageCode,
    this.countryCode,
    this.authModel,
  });

  Map<String, dynamic> toMap({bool supabase = true}) {
    final map = {
      'establishment_id': establishmentId,
      'is_dark_mode': isDarkMode,
      'language_code': languageCode,
      'country_code': countryCode,
    };

    if (supabase) map.addAll({"auth_model": authModel?.toMap()});

    return map;
  }

  factory PreferencesModel.fromMap(Map<String, dynamic> map) {
    return PreferencesModel(
      establishmentId: map['establishment_id'],
      isDarkMode: map['is_dark_mode'],
      languageCode: map['language_code'],
      countryCode: map['country_code'],
      authModel: map['auth_model'] != null ? AuthModel.fromMap(map['auth_model']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreferencesModel.fromJson(String source) => PreferencesModel.fromMap(json.decode(source));

  PreferencesModel copyWith({
    int? establishmentId,
    bool? isDarkMode,
    String? languageCode,
    String? countryCode,
    AuthModel? authModel,
  }) {
    return PreferencesModel(
      establishmentId: establishmentId ?? this.establishmentId,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode,
      authModel: authModel ?? this.authModel,
    );
  }
}
