import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/enums/check_point_enum.dart';

class PaymentMethodCompanyModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? tax;
  final String? companySlug;
  final int? paymentMethodId;
  final PaymentMethodsModel? paymentMethod;
  final List<CheckPointEnum> checkPoints;
  PaymentMethodCompanyModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.tax,
    this.companySlug,
    this.paymentMethodId,
    this.paymentMethod,
    this.checkPoints = const [],
  });

  PaymentMethodCompanyModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? tax,
    String? companySlug,
    int? paymentMethodId,
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
        id: map['id']?.toInt(),
        createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
        updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
        tax: map['tax']?.toDouble(),
        companySlug: map['company_slug'],
        paymentMethodId: map['payment_method_id']?.toInt(),
        paymentMethod: map['payment_method'] != null ? PaymentMethodsModel.fromMap(map['payment_method']) : null,
        checkPoints: List<CheckPointEnum>.from(map['check_points']?.map((checkPoint) {
              return CheckPointEnum.values.firstWhere((element) => element.name == checkPoint);
            }).toList() ??
            []));
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodCompanyModel.fromJson(String source) => PaymentMethodCompanyModel.fromMap(json.decode(source));
}
