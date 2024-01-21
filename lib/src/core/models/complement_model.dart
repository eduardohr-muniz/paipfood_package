import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

enum ComplementType {
  item,
  pizza,
  optionalPizza,
}

class ComplementModel {
  final String id;
  final String establishmentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  int index;
  String name;
  String identifier;
  int qtyMin;
  int qtyMax;
  ComplementType complementType;
  List<ItemModel> items;
  bool visible;
  bool isDeleted;
  bool isMultiple;
  bool isRequired;
  SyncState syncState;
  String? idCategoryPizza;
  ComplementModel({
    required this.id,
    required this.establishmentId,
    required this.index,
    required this.items,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.identifier = '',
    this.qtyMin = 0,
    this.qtyMax = 0,
    this.complementType = ComplementType.item,
    this.visible = true,
    this.isDeleted = false,
    this.isMultiple = false,
    this.isRequired = false,
    this.syncState = SyncState.none,
    this.idCategoryPizza,
  });
  static const String box = "complements";
  ComplementModel copyWith({
    String? id,
    String? establishmentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? index,
    String? name,
    String? identifier,
    int? qtyMin,
    int? qtyMax,
    ComplementType? complementType,
    List<ItemModel>? items,
    bool? visible,
    bool? isDeleted,
    bool? isMultiple,
    bool? isRequired,
    SyncState? syncState,
    String? idCategoryPizza,
  }) {
    return ComplementModel(
      id: id ?? this.id,
      establishmentId: establishmentId ?? this.establishmentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      index: index ?? this.index,
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      qtyMin: qtyMin ?? this.qtyMin,
      qtyMax: qtyMax ?? this.qtyMax,
      complementType: complementType ?? this.complementType,
      items: items ?? this.items,
      visible: visible ?? this.visible,
      isDeleted: isDeleted ?? this.isDeleted,
      isMultiple: isMultiple ?? this.isMultiple,
      isRequired: isRequired ?? this.isRequired,
      syncState: syncState ?? this.syncState,
      idCategoryPizza: idCategoryPizza ?? this.idCategoryPizza,
    );
  }

//List<ItemModel> items;
  ComplementModel clone() {
    return ComplementModel(
      establishmentId: establishmentId,
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      index: index,
      name: name,
      identifier: identifier,
      qtyMin: qtyMin,
      qtyMax: qtyMax,
      complementType: complementType,
      items: items.map((e) => e.clone()).toList(),
      visible: visible,
      isMultiple: isMultiple,
      isRequired: isRequired,
      isDeleted: isDeleted,
      syncState: syncState,
      idCategoryPizza: idCategoryPizza,
    );
  }

  Map<String, dynamic> toMap({bool isComplete = true}) {
    final map = {
      'id': id,
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'name': name,
      'identifier': identifier,
      'qty_min': qtyMin,
      'qty_max': qtyMax,
      'complement_type': complementType.name,
      'visible': visible,
      'is_deleted': isDeleted,
      'is_multiple': isMultiple,
      'is_required': isRequired,
      'id_category_pizza': idCategoryPizza
    };
    final mapComplete = {
      ItemModel.box: items.map((e) => e.toMap()).toList(),
      'sync_state': syncState.name,
    };
    if (isComplete) map.addAll(mapComplete);
    return map;
  }

  factory ComplementModel.fromMap(Map map) {
    return ComplementModel(
      id: map['id'],
      establishmentId: map['establishment_id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      name: map['name'] ?? '',
      identifier: map['identifier'] ?? '',
      qtyMin: map['qty_min']?.toInt() ?? 0,
      qtyMax: map['qty_max']?.toInt() ?? 0,
      complementType: ComplementType.values.firstWhere((element) => element.name == map['complement_type'], orElse: () => ComplementType.item),
      items: map[ItemModel.box] != null
          ? List<ItemModel>.from(map[ItemModel.box]?.map((e) {
              return ItemModel.fromMap(e);
            }))
          : [],
      visible: map['visible'] ?? true,
      isDeleted: map['is_deleted'] ?? false,
      syncState: map['sync_state'] != null
          ? SyncState.values.firstWhere((element) => element.name == map['sync_state'], orElse: () => SyncState.none)
          : SyncState.none,
      isMultiple: map['is_multiple'] ?? false,
      isRequired: map['is_required'] ?? false,
      idCategoryPizza: map['id_category_pizza'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplementModel.fromJson(String source) => ComplementModel.fromMap(json.decode(source));

  List<ItemModel> get itemsOrderByIndex => items..sort((a, b) => a.index.compareTo(b.index));

  List<String> get itemIds => items.map((e) => e.id).toList();
  List<String> imageItens() {
    final List<String> results = [];
    items.map((e) {
      if (e.image != null) results.add(e.image!);
    }).toList();
    return results;
  }
}
