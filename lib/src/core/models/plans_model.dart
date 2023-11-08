import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'country_model.dart';

class PlansModel {
  int? id;
  DateTime createdAt;
  String name;
  double price;
  double? promotionalPrice;
  int? promotionDurationMounths;
  CountryModel countryId;
  // UsageLimitModel usageLimit;
  bool autoRenew;
  String? discountCoupon;
  String? discountValue;
  String? planType;
  String terms;
  String? banner;
  String status;
  PlansModel({
    this.id,
    required this.createdAt,
    this.name = '',
    this.price = 0.0,
    this.promotionalPrice,
    this.promotionDurationMounths,
    required this.countryId,
    this.autoRenew = true,
    this.discountCoupon,
    this.discountValue,
    this.planType,
    this.terms = '',
    this.banner,
    this.status = '',
  });

  PlansModel copyWith({
    ValueGetter<int?>? id,
    DateTime? createdAt,
    String? name,
    double? price,
    ValueGetter<double?>? promotionalPrice,
    ValueGetter<int?>? promotionDurationMounths,
    CountryModel? countryId,
    bool? autoRenew,
    ValueGetter<String?>? discountCoupon,
    ValueGetter<String?>? discountValue,
    ValueGetter<String?>? planType,
    String? terms,
    ValueGetter<String?>? banner,
    String? status,
  }) {
    return PlansModel(
      id: id?.call() ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice?.call() ?? this.promotionalPrice,
      promotionDurationMounths: promotionDurationMounths?.call() ?? this.promotionDurationMounths,
      countryId: countryId ?? this.countryId,
      autoRenew: autoRenew ?? this.autoRenew,
      discountCoupon: discountCoupon?.call() ?? this.discountCoupon,
      discountValue: discountValue?.call() ?? this.discountValue,
      planType: planType?.call() ?? this.planType,
      terms: terms ?? this.terms,
      banner: banner?.call() ?? this.banner,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.millisecondsSinceEpoch,
      'name': name,
      'price': price,
      'promotional_price': promotionalPrice,
      'promotion_duration_mounths': promotionDurationMounths,
      'country_id': countryId.toMap(),
      'auto_renew': autoRenew,
      'discount_coupon': discountCoupon,
      'discount_value': discountValue,
      'plan_type': planType,
      'terms': terms,
      'banner': banner,
      'status': status,
    };
  }

  factory PlansModel.fromMap(Map<String, dynamic> map) {
    return PlansModel(
      id: map['id']?.toInt(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble(),
      promotionDurationMounths: map['promotion_duration_mounths']?.toInt(),
      countryId: CountryModel.fromMap(map['country_id']),
      autoRenew: map['auto_renew'] ?? false,
      discountCoupon: map['discount_coupon'],
      discountValue: map['discount_value'],
      planType: map['plan_type'],
      terms: map['terms'] ?? '',
      banner: map['banner'],
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlansModel.fromJson(String source) => PlansModel.fromMap(json.decode(source));
}
