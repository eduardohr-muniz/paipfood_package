import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class MercadoPagoModel {
  final PaymentProvider paymentProvider;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  MercadoPagoModel({
    required this.paymentProvider,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  MercadoPagoModel copyWith({
    PaymentProvider? paymentProvider,
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MercadoPagoModel(
      paymentProvider: paymentProvider ?? this.paymentProvider,
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshToken: refreshToken ?? this.refreshToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payment_provider': paymentProvider.name,
      'access_token': accessToken,
      'expires_in': expiresIn,
      'refresh_token': refreshToken,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory MercadoPagoModel.fromMap(Map<String, dynamic> map) {
    return MercadoPagoModel(
      paymentProvider: map['payment_provider'] != null ? PaymentProvider.fromMap(map['payment_provider']) : PaymentProvider.mercadoPago,
      accessToken: map['access_token'],
      expiresIn: map['expires_in'],
      refreshToken: map['refresh_token'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : DateTime.now(),
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MercadoPagoModel.fromJson(String source) => MercadoPagoModel.fromMap(json.decode(source));
}
