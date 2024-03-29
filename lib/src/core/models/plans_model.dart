import 'dart:convert';
import 'country_model.dart';

class PlansModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final double price;
  final double? promotionalPrice;
  final int? promotionDurationMounths;
  final CountryModel countryId;
  final // UsageLimitModel usageLimit;
      bool autoRenew;
  final String? discountCoupon;
  final String? discountValue;
  final String? planType;
  final String terms;
  final String? banner;
  final String status;
  PlansModel({
    required this.createdAt,
    required this.countryId,
    required this.id,
    this.name = '',
    this.price = 0.0,
    this.promotionalPrice,
    this.promotionDurationMounths,
    this.autoRenew = true,
    this.discountCoupon,
    this.discountValue,
    this.planType,
    this.terms = '',
    this.banner,
    this.status = '',
  });
  static const String box = "plans";
  PlansModel copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
    double? price,
    double? promotionalPrice,
    int? promotionDurationMounths,
    CountryModel? countryId,
    // UsageLimitModel? usageLimit,
    bool? autoRenew,
    String? discountCoupon,
    String? discountValue,
    String? planType,
    String? terms,
    String? banner,
    String? status,
  }) {
    return PlansModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      promotionDurationMounths: promotionDurationMounths ?? this.promotionDurationMounths,
      countryId: countryId ?? this.countryId,
      // usageLimit: usageLimit ?? this.usageLimit,
      autoRenew: autoRenew ?? this.autoRenew,
      discountCoupon: discountCoupon ?? this.discountCoupon,
      discountValue: discountValue ?? this.discountValue,
      planType: planType ?? this.planType,
      terms: terms ?? this.terms,
      banner: banner ?? this.banner,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
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
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
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
