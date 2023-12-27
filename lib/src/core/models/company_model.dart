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
  List<PaymentMethodsModel> paymentMethods;
  String facebook;
  String instagram;
  ThemeEnum theme;
  SyncState syncState;
  CompanyModel({
    required this.slug,
    this.userAdminId,
    this.establishmentDefaultId,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.establishments = const [],
    this.paymentMethods = const [],
    this.facebook = '',
    this.instagram = '',
    this.theme = ThemeEnum.paip,
    this.syncState = SyncState.none,
  });

  CompanyModel copyWith({
    String? slug,
    String? userAdminId,
    String? establishmentDefaultId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    List<EstablishmentModel>? establishments,
    List<PaymentMethodsModel>? paymentMethods,
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
      paymentMethods: paymentMethods ?? this.paymentMethods,
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
      paymentMethods: List<PaymentMethodsModel>.from(map['payment_methods']?.map((paymentMethod) {
            return PaymentMethodsModel.fromMap(paymentMethod);
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
