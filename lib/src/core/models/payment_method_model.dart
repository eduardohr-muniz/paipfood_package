import 'dart:convert';

import 'package:paipfood_package/src/core/enums/payment_enum.dart';

class PaymentMethodModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String description;
  final String countryId;
  final bool isApp;
  final PaymentFlagEnum paymentId;
  final bool isLocal;
  final PaymentType paymentType;
  final double? rate;
  final double? ratePercent;
  final double? rateAntecipation;
  final double? rateAntecipationPercent;
  PaymentMethodModel({
    required this.id,
    required this.createdAt,
    required this.countryId,
    required this.isApp,
    required this.paymentId,
    required this.isLocal,
    required this.paymentType,
    required this.name,
    this.description = '',
    this.rate,
    this.ratePercent,
    this.rateAntecipation,
    this.rateAntecipationPercent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'country_id': countryId,
      'is_app': isApp,
      'payment_id': paymentId.name,
      'is_local': isLocal,
      'payment_type': paymentType.name,
      'rate': rate,
      'rate_percent': ratePercent,
      'rate_antecipation': rateAntecipation,
      'rate_antecipation_percent': rateAntecipationPercent,
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      countryId: map['country_id'] ?? '',
      isApp: map['is_app'],
      paymentId: PaymentFlagEnum.fromMap(map['payment_id']),
      isLocal: map['is_local'],
      paymentType: PaymentType.fromMap(map['payment_type']),
      rate: map['rate']?.toDouble(),
      ratePercent: map['rate_percent']?.toDouble(),
      rateAntecipation: map['rate_antecipation']?.toDouble(),
      rateAntecipationPercent: map['rate_antecipation_percent']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) => PaymentMethodModel.fromMap(json.decode(source));

  PaymentMethodModel copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
    String? countryId,
    bool? isApp,
    PaymentFlagEnum? paymentId,
    bool? isLocal,
    PaymentType? paymentType,
    double? rate,
    double? ratePercent,
    double? rateAntecipation,
    double? rateAntecipationPercent,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      countryId: countryId ?? this.countryId,
      isApp: isApp ?? this.isApp,
      paymentId: paymentId ?? this.paymentId,
      isLocal: isLocal ?? this.isLocal,
      paymentType: paymentType ?? this.paymentType,
      rate: rate ?? this.rate,
      ratePercent: ratePercent ?? this.ratePercent,
      rateAntecipation: rateAntecipation ?? this.rateAntecipation,
      rateAntecipationPercent: rateAntecipationPercent ?? this.rateAntecipationPercent,
    );
  }
}
