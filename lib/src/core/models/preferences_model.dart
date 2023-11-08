import 'dart:convert';

import 'package:paipfood_package/src/core/provider/global_variables.dart';

class PreferencesModel {
  final String? establishmentId;
  final bool? isDarkMode;
  final String? languageCode;
  final String? countryCode;

  PreferencesModel({
    this.establishmentId,
    this.isDarkMode,
    this.languageCode,
    this.countryCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'establishment_id': establishmentId ?? slug,
      'is_dark_mode': isDarkMode,
      'language_code': languageCode,
      'country_code': countryCode,
    };
  }

  factory PreferencesModel.fromMap(Map<String, dynamic> map) {
    return PreferencesModel(
      establishmentId: map['establishment_id'],
      isDarkMode: map['is_dark_mode'],
      languageCode: map['language_code'],
      countryCode: map['country_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PreferencesModel.fromJson(String source) => PreferencesModel.fromMap(json.decode(source));

  PreferencesModel copyWith({
    String? establishmentId,
    bool? isDarkMode,
    String? languageCode,
    String? countryCode,
  }) {
    return PreferencesModel(
      establishmentId: establishmentId ?? this.establishmentId,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
