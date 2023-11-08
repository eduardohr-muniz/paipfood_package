import 'dart:convert';
import 'package:paipfood_package/src/core/provider/global_variables.dart';

import 'item_model.dart';

enum ComplementType {
  item,
  pizza,
}

class ComplementModel {
  final int? index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? establishmentId;
  final int? id;
  final String name;
  final String description;
  final String nickName;
  final int qtyMin;
  final int qtyMax;
  final ComplementType complementType;
  final List<ItemModel>? items;
  final bool isHidden;
  ComplementModel({
    this.index,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.name = '',
    this.description = '',
    this.nickName = '',
    this.qtyMin = 0,
    this.qtyMax = 0,
    this.complementType = ComplementType.item,
    this.items,
    this.isHidden = false,
  });

  ComplementModel copyWith({
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? establishmentId,
    int? id,
    String? name,
    String? description,
    String? nickName,
    int? qtyMin,
    int? qtyMax,
    ComplementType? complementType,
    List<ItemModel>? items,
    bool? isHidden,
  }) {
    return ComplementModel(
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      nickName: nickName ?? this.nickName,
      qtyMin: qtyMin ?? this.qtyMin,
      qtyMax: qtyMax ?? this.qtyMax,
      complementType: complementType ?? this.complementType,
      items: items ?? this.items,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'name': name,
      'description': description,
      'nick_name': nickName,
      'qty_min': qtyMin,
      'qty_max': qtyMax,
      'complement_type': complementType,
      'items': items?.map((x) => x.toMap()).toList(),
      'is_hidden': isHidden,
    };
  }

  factory ComplementModel.fromMap(Map<String, dynamic> map) {
    return ComplementModel(
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      nickName: map['nick_name'] ?? '',
      qtyMin: map['qty_min']?.toInt() ?? 0,
      qtyMax: map['qty_max']?.toInt() ?? 0,
      complementType: ComplementType.values.firstWhere((element) => map['complement_type'], orElse: () => ComplementType.item),
      items: map['items'] != null ? List<ItemModel>.from(map['items']?.map(ItemModel.fromMap)) : null,
      isHidden: map['is_hidden'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplementModel.fromJson(String source) => ComplementModel.fromMap(json.decode(source));
}
