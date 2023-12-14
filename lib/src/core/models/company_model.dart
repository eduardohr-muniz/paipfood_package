import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

import 'zz_models_export.dart';

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
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? name;
  final String? userAdminId;
  final int? establishmentDefaultId;
  final List<EstablishmentModel> establishments;
  final List<PaymentMethodsModel> paymentMethods;
  final String facebook;
  final String instagram;
  CompanyModel({
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.name,
    this.userAdminId,
    this.establishmentDefaultId,
    this.establishments = const [],
    this.paymentMethods = const [],
    this.facebook = '',
    this.instagram = '',
  });

  CompanyModel copyWith({
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? name,
    String? userAdminId,
    int? establishmentDefaultId,
    List<EstablishmentModel>? establishments,
    List<PaymentMethodsModel>? paymentMethods,
    String? facebook,
    String? instagram,
  }) {
    return CompanyModel(
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      name: name ?? this.name,
      userAdminId: userAdminId ?? this.userAdminId,
      establishmentDefaultId: establishmentDefaultId ?? this.establishmentDefaultId,
      establishments: establishments ?? this.establishments,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slug': slug != null ? Utils.onlyAlphanumeric(slug!, undereline: true) : null,
      'updated_at': updatedAt?.toIso8601String(),
      'name': name,
      'user_admin_id': userAdminId,
      'establishment_default_id': establishmentDefaultId,
      'facebook': facebook,
      'instagram': instagram,
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
      facebook: map['facebook'],
      instagram: map['instagram'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));
}
