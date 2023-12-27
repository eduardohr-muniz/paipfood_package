import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

enum Itemtype {
  item,
  pizza;
}

class ItemModel {
  int index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String establishmentId;
  String id;
  String name;
  String nickName;
  String description;
  double price;
  double promotionalPrice;
  String image;
  bool isPreSelected;
  String complementId;
  bool visible;
  List<SizeModel> sizes;
  final Itemtype itemtype;
  bool isDeleted;
  SyncState syncState;

  ItemModel({
    required this.id,
    required this.index,
    required this.establishmentId,
    required this.complementId,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.nickName = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice = 0.0,
    this.image = '',
    this.isPreSelected = false,
    this.visible = false,
    this.sizes = const [],
    this.itemtype = Itemtype.item,
    this.isDeleted = false,
    this.syncState = SyncState.none,
  });

  ItemModel copyWith({
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? establishmentId,
    String? id,
    String? name,
    String? nickName,
    String? description,
    double? price,
    double? promotionalPrice,
    String? image,
    bool? isPreSelected,
    String? complementId,
    bool? visible,
    List<SizeModel>? sizes,
    Itemtype? itemtype,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return ItemModel(
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      'nick_name': nickName,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'image': image,
      'is_pre_selected': isPreSelected,
      'complement_id': complementId,
      'visible': visible,
      'item_type': itemtype.name,
      'is_deleted': isDeleted,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      complementId: map['complement_id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      name: map['name'] ?? '',
      nickName: map['nick_name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      isPreSelected: map['is_pre_selected'],
      visible: map['visible'] ?? false,
      sizes: map['sizes'] != null ? List<SizeModel>.from(map['sizes']?.map(SizeModel.fromMap)) : [],
      itemtype: Itemtype.values.firstWhere((element) => element.name == map['item_type'], orElse: () => Itemtype.item),
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));
}
