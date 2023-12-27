import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class PaymentMethodCompanyModel {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double tax;
  final String companySlug;
  final String paymentMethodId;
  final PaymentMethodsModel paymentMethod;
  final List<CheckPointEnum> checkPoints;
  PaymentMethodCompanyModel({
    required this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.id = '',
    this.tax = 0.0,
    this.companySlug = '',
    this.paymentMethodId = '',
    this.checkPoints = const [],
  });

  PaymentMethodCompanyModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? tax,
    String? companySlug,
    String? paymentMethodId,
    PaymentMethodsModel? paymentMethod,
    List<CheckPointEnum>? checkPoints,
  }) {
    return PaymentMethodCompanyModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tax: tax ?? this.tax,
      companySlug: companySlug ?? this.companySlug,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      checkPoints: checkPoints ?? this.checkPoints,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'tax': tax,
      'company_slug': companySlug,
      'payment_method_id': paymentMethodId,
      'check_points': checkPoints
    };
  }

  factory PaymentMethodCompanyModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodCompanyModel(
        id: map['id'],
        createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
        updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
        tax: map['tax']?.toDouble(),
        companySlug: map['company_slug'],
        paymentMethodId: map['payment_method_id'],
        paymentMethod: PaymentMethodsModel.fromMap(map['payment_method']),
        checkPoints: List<CheckPointEnum>.from(map['check_points']?.map((checkPoint) {
              return CheckPointEnum.values.firstWhere((element) => element.name == checkPoint);
            }).toList() ??
            []));
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodCompanyModel.fromJson(String source) => PaymentMethodCompanyModel.fromMap(json.decode(source));
}
