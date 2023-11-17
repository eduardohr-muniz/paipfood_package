import 'dart:convert';

import 'paip_models.dart';

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
  CompanyModel({
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.name,
    this.userAdminId,
    this.establishmentDefaultId,
    this.establishments = const [],
  });

  CompanyModel copyWith({
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? name,
    String? userAdmId,
    int? establishmentDefaultId,
    List<EstablishmentModel>? establishments,
  }) {
    return CompanyModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      userAdminId: userAdmId ?? userAdminId,
      establishmentDefaultId: establishmentDefaultId ?? this.establishmentDefaultId,
      establishments: establishments ?? this.establishments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slug': slug,
      'updated_at': updatedAt?.toIso8601String(),
      'name': name,
      'user_admin_id': userAdminId,
      'establishment_default_id': establishmentDefaultId,
      'establishments': establishments.map((x) => x.toMap()).toList(),
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
      establishments: List<EstablishmentModel>.from(map['establishments']?.map(EstablishmentModel.fromMap) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));
}
