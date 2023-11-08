import 'dart:convert';

import 'package:flutter/widgets.dart';

class CountryModel {
  final String name;
  final String languageCode;
  final String? countryCode;
  const CountryModel({
    required this.name,
    required this.languageCode,
    this.countryCode,
  });

  CountryModel copyWith({
    String? name,
    String? languageCode,
    ValueGetter<String?>? countryCode,
  }) {
    return CountryModel(
      name: name ?? this.name,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode?.call() ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'language_code': languageCode,
      'country_code': countryCode,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] ?? '',
      languageCode: map['language_code'] ?? '',
      countryCode: map['country_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source));
}
