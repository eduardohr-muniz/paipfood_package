import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'paip_models.dart';

class CompanyModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final int? id;
  final String? name;
  final String? userAdmId;
  final List<EstablishmentModel> establishments;
  CompanyModel({
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.id,
    this.name,
    this.userAdmId,
    this.establishments = const [],
  });

  CompanyModel copyWith({
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<DateTime?>? updatedAt,
    bool? toUpdate,
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? userAdmId,
    List<EstablishmentModel>? establishments,
  }) {
    return CompanyModel(
      createdAt: createdAt?.call() ?? this.createdAt,
      updatedAt: updatedAt?.call() ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      id: id?.call() ?? this.id,
      name: name?.call() ?? this.name,
      userAdmId: userAdmId?.call() ?? this.userAdmId,
      establishments: establishments ?? this.establishments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'id': id,
      'name': name,
      'user_adm_id': userAdmId,
      'establishments': establishments.map((x) => x.toMap()).toList(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
      id: map['id']?.toInt(),
      name: map['name'],
      userAdmId: map['user_adm_id'],
      establishments: List<EstablishmentModel>.from(map['establishments']?.map(EstablishmentModel.fromMap) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));
}
