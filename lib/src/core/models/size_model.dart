import 'dart:convert';
import 'package:paipfood_package/src/core/provider/global_variables.dart';

import 'zz_models_export.dart';

class SizeModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final int? establishmentId;
  final int? id;
  final int? itemId;
  final int? productId;
  final double? price;
  final double? promotionalPrice;
  final ProductModel? product;
  final ItemModel? item;
  SizeModel({
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.itemId,
    this.productId,
    this.price,
    this.promotionalPrice,
    this.product,
    this.item,
  });

  SizeModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    int? establishmentId,
    int? id,
    int? itemId,
    int? productId,
    double? price,
    double? promotionalPrice,
    ProductModel? product,
    ItemModel? item,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'toUpdate': toUpdate,
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'item_id': itemId,
      'product_id': productId,
      'price': price,
      'promotional_price': promotionalPrice,
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
