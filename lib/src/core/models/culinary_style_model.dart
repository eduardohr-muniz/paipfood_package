import 'dart:convert';

class CulinaryStyleModel {
  String name;
  String country;
  CulinaryStyleModel({
    this.name = '',
    this.country = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'country': country,
    };
  }

  factory CulinaryStyleModel.fromMap(Map<String, dynamic> map) {
    return CulinaryStyleModel(
      name: map['name'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CulinaryStyleModel.fromJson(String source) => CulinaryStyleModel.fromMap(json.decode(source));
}
