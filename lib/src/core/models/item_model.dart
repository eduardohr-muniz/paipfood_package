import 'dart:convert';

import 'size_model.dart';

enum Itemtype {
  item,
  pizza;
}

class ItemModel {
  final int? index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final int? establishmentId;
  final int? id;
  final String name;
  final String nickName;
  final String description;
  final double price;
  final double promotionalPrice;
  final String image;
  final bool? isPreSelected;
  final int complementId;
  final bool visible;
  final List<SizeModel>? sizes;
  final Itemtype itemtype;
  ItemModel({
    this.index,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.name = '',
    this.nickName = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice = 0.0,
    this.image = '',
    this.isPreSelected,
    this.complementId = 0,
    this.visible = false,
    this.sizes,
    this.itemtype = Itemtype.item,
  });

  ItemModel copyWith({
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    int? establishmentId,
    int? id,
    String? name,
    String? nickName,
    String? description,
    double? price,
    double? promotionalPrice,
    String? image,
    bool? isPreSelected,
    int? complementId,
    bool? visible,
    List<SizeModel>? sizes,
    Itemtype? itemtype,
  }) {
    return ItemModel(
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      description: description ?? this.description,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      image: image ?? this.image,
      isPreSelected: isPreSelected ?? this.isPreSelected,
      complementId: complementId ?? this.complementId,
      visible: visible ?? this.visible,
      sizes: sizes ?? this.sizes,
      itemtype: itemtype ?? this.itemtype,
    );
  }

  Map<String, dynamic> toMap() {
    final map = {
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'name': name,
      'nick_name': nickName,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'image': image,
      'is_pre_selected': isPreSelected,
      'complement_id': complementId,
      'visible': visible,
      'item_type': itemtype.name,
    };
    if (id != null) map.addAll({'id': id});

    return map;
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['toUpdate'] ?? false,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      nickName: map['nick_name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      isPreSelected: map['is_pre_selected'],
      complementId: map['complement_id']?.toInt() ?? 0,
      visible: map['visible'] ?? false,
      sizes: map['sizes'] != null ? List<SizeModel>.from(map['sizes']?.map(SizeModel.fromMap)) : null,
      itemtype: Itemtype.values.firstWhere((element) => element.name == map['item_type'], orElse: () => Itemtype.item),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));
}
