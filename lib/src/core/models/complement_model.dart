import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

enum ComplementType {
  item,
  pizza,
}

class ComplementModel {
  final String establishmentId;
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  int index;
  String name;
  String description;
  String nickName;
  int qtyMin;
  int qtyMax;
  final ComplementType complementType;
  List<ItemModel>? items;
  bool visible;
  bool isDeleted;
  SyncState syncState;
  ComplementModel({
    required this.establishmentId,
    required this.id,
    required this.index,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.description = '',
    this.nickName = '',
    this.qtyMin = 0,
    this.qtyMax = 0,
    this.complementType = ComplementType.item,
    this.items,
    this.visible = true,
    this.isDeleted = false,
    this.syncState = SyncState.none,
  });

  ComplementModel copyWith({
    String? establishmentId,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? index,
    String? name,
    String? description,
    String? nickName,
    int? qtyMin,
    int? qtyMax,
    ComplementType? complementType,
    List<ItemModel>? items,
    bool? visible,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return ComplementModel(
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      index: index ?? this.index,
      name: name ?? this.name,
      description: description ?? this.description,
      nickName: nickName ?? this.nickName,
      qtyMin: qtyMin ?? this.qtyMin,
      qtyMax: qtyMax ?? this.qtyMax,
      complementType: complementType ?? this.complementType,
      items: items ?? this.items,
      visible: visible ?? this.visible,
      isDeleted: isDeleted ?? this.isDeleted,
      syncState: syncState ?? this.syncState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'name': name,
      'description': description,
      'nick_name': nickName,
      'qty_min': qtyMin,
      'qty_max': qtyMax,
      'complement_type': complementType.name,
      'visible': visible,
      'is_deleted': isDeleted,
    };
  }

  factory ComplementModel.fromMap(Map<String, dynamic> map) {
    return ComplementModel(
      id: map['id'],
      establishmentId: map['establishment_id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      nickName: map['nick_name'] ?? '',
      qtyMin: map['qty_min']?.toInt() ?? 0,
      qtyMax: map['qty_max']?.toInt() ?? 0,
      complementType: ComplementType.values.firstWhere((element) => element.name == map['complement_type'], orElse: () => ComplementType.item),
      items: map['items'] != null ? List<ItemModel>.from(map['items']?.map(ItemModel.fromMap)) : null,
      visible: map['visible'] ?? true,
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplementModel.fromJson(String source) => ComplementModel.fromMap(json.decode(source));
}
