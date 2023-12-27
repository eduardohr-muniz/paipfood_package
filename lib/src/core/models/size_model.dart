import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

import 'zz_models_export.dart';

class SizeModel {
  DateTime? createdAt;
  DateTime? updatedAt;
  bool toUpdate;
  String establishmentId;
  String id;
  String? itemId;
  String productId;
  double price;
  double? promotionalPrice;
  ProductModel? product;
  ItemModel? item;
  bool isDeleted;
  SyncState syncState;
  SizeModel({
    required this.id,
    required this.establishmentId,
    required this.productId,
    required this.price,
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.promotionalPrice,
    this.product,
    this.item,
    this.syncState = SyncState.none,
    this.isDeleted = false,
  });

  SizeModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? establishmentId,
    String? id,
    String? itemId,
    String? productId,
    double? price,
    double? promotionalPrice,
    ProductModel? product,
    ItemModel? item,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return SizeModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      product: product ?? this.product,
      item: item ?? this.item,
      isDeleted: isDeleted ?? this.isDeleted,
      syncState: syncState ?? this.syncState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'item_id': itemId,
      'product_id': productId,
      'price': price,
      'promotional_price': promotionalPrice,
      'is_deleted': isDeleted,
    };
  }

  factory SizeModel.fromMap(Map<String, dynamic> map) {
    return SizeModel(
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['toUpdate'] ?? false,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      itemId: map['item_id']?.toInt() ?? 0,
      productId: map['product_id']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeModel.fromJson(String source) => SizeModel.fromMap(json.decode(source));
}
