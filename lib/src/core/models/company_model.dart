import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class RangeModel {
  int offSet;
  int limit;
  RangeModel({
    this.offSet = 0,
    this.limit = 9,
  });

  Map<String, dynamic> toMap() {
    return {"Range": "$offSet-$limit"};
  }

  @override
  String toString() => '$offSet-$limit';
}

class CompanyModel {
  final String slug;
  final String? userAdminId;
  final String? establishmentDefaultId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String name;
  List<EstablishmentModel> establishments;
  List<PaymentFlagEnum> paymentFlagsLocal;
  List<PaymentFlagEnum> paymentFlagsApp;
  String facebook;
  String instagram;
  ThemeEnum theme;
  SyncState syncState;
  CompanyModel({
    required this.slug,
    required this.paymentFlagsApp,
    this.userAdminId,
    this.establishmentDefaultId,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.establishments = const [],
    this.paymentFlagsLocal = const [PaymentFlagEnum.money, PaymentFlagEnum.visa, PaymentFlagEnum.master],
    this.facebook = '',
    this.instagram = '',
    this.theme = ThemeEnum.paip,
    this.syncState = SyncState.none,
  });
  static const String box = "companies";
  CompanyModel copyWith({
    String? slug,
    String? userAdminId,
    String? establishmentDefaultId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    List<EstablishmentModel>? establishments,
    List<PaymentFlagEnum>? paymentFlagsLocal,
    List<PaymentFlagEnum>? paymentFlagsApp,
    String? facebook,
    String? instagram,
    ThemeEnum? theme,
    SyncState? syncState,
  }) {
    return CompanyModel(
      slug: slug ?? this.slug,
      userAdminId: userAdminId ?? this.userAdminId,
      establishmentDefaultId: establishmentDefaultId ?? this.establishmentDefaultId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      establishments: establishments ?? this.establishments,
      paymentFlagsLocal: paymentFlagsLocal ?? this.paymentFlagsLocal,
      paymentFlagsApp: paymentFlagsApp ?? this.paymentFlagsApp,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      theme: theme ?? this.theme,
      syncState: syncState ?? this.syncState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slug': Utils.onlyAlphanumeric(slug, undereline: true),
      'updated_at': updatedAt?.toIso8601String(),
      'name': name,
      'user_admin_id': userAdminId,
      'establishment_default_id': establishmentDefaultId,
      'facebook': facebook,
      'instagram': instagram,
      'theme': theme.name,
      'payment_flags_local': paymentFlagsLocal.map((e) => e.name).toList(),
      'payment_flags_app': paymentFlagsApp.map((e) => e.name).toList(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      slug: map['slug'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      name: map['name'],
      establishmentDefaultId: map['establishment_default_id'],
      userAdminId: map['user_admin_id'],
      establishments: List<EstablishmentModel>.from(map['establishments']?.map((establishments) {
            return EstablishmentModel.fromMap(establishments);
          }).toList() ??
          const []),
      paymentFlagsLocal: List<PaymentFlagEnum>.from(map['payment_flags_local']?.map((paymentMethod) {
            return PaymentFlagEnum.fromMap(paymentMethod);
          }).toList() ??
          []),
      paymentFlagsApp: List<PaymentFlagEnum>.from(map['payment_flags_app']?.map((paymentMethod) {
            return PaymentFlagEnum.fromMap(paymentMethod);
          }).toList() ??
          []),
      facebook: map['facebook'] ?? "",
      instagram: map['instagram'] ?? "",
      theme: map['theme'] != null ? ThemeEnum.values.firstWhere((element) => element.name == map['theme']) : ThemeEnum.paip,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));
}
