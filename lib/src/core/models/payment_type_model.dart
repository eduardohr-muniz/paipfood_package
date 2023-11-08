import 'dart:convert';

class PaymentTypeModel {
  final int id;
  final String name;
  final String countryId;
  PaymentTypeModel({
    required this.id,
    required this.name,
    required this.countryId,
  });

  PaymentTypeModel copyWith({
    int? id,
    String? name,
    String? countryId,
  }) {
    return PaymentTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      countryId: countryId ?? this.countryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country_id': countryId,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      countryId: map['country_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) => PaymentTypeModel.fromMap(json.decode(source));
}
