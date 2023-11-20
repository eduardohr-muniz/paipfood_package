import 'dart:convert';

class PaymentMethodsModel {
  final int id;
  final String name;
  final String countryId;
  final double? tax;
  PaymentMethodsModel({
    required this.id,
    required this.name,
    required this.countryId,
    this.tax,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country_id': countryId,
      'tax': tax,
    };
  }

  factory PaymentMethodsModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodsModel(
      id: map['id']?.toInt(),
      name: map['name'],
      countryId: map['country_id'],
      tax: map['tax'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodsModel.fromJson(String source) => PaymentMethodsModel.fromMap(json.decode(source));
}
