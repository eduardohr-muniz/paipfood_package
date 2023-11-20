import 'dart:convert';
import 'package:paipfood_package/src/core/provider/global_variables.dart';

import 'complement_model.dart';

enum QtyFlavorsPizza {
  one(1),
  two(2),
  tree(3),
  four(4);

  final int qty;
  const QtyFlavorsPizza(this.qty);
}

enum ProductType {
  product,
  pizza;
}

class ProductModel {
  final int? index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final int? establishmentId;
  final int? id;
  final QtyFlavorsPizza? qtyFlavorsPizza;
  final String name;
  final String description;
  final double price;
  final double promotionalPrice;
  final bool isPromotional;
  final bool isVisible;
  final ProductType productType;
  final String? image;
  final int? categoryId;
  final List<ComplementModel>? complements;

  ProductModel({
    this.index,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.qtyFlavorsPizza,
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice = 0.0,
    this.isPromotional = false,
    this.isVisible = true,
    this.productType = ProductType.product,
    this.image,
    this.categoryId,
    this.complements,
  });

  ProductModel copyWith({
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    int? establishmentId,
    int? id,
    QtyFlavorsPizza? qtyFlavorsPizza,
    String? name,
    String? description,
    double? price,
    double? promotionalPrice,
    bool? isPromotional,
    bool? isVisible,
    ProductType? productType,
    String? image,
    int? categoryId,
    List<ComplementModel>? complements,
  }) {
    return ProductModel(
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      qtyFlavorsPizza: qtyFlavorsPizza ?? this.qtyFlavorsPizza,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      isPromotional: isPromotional ?? this.isPromotional,
      isVisible: isVisible ?? this.isVisible,
      productType: productType ?? this.productType,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      complements: complements ?? this.complements,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'toUpdate': toUpdate,
      'establishment_id': establishmentId,
      'id': id,
      'qty_flavors_pizza': qtyFlavorsPizza,
      'name': name,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'is_promotional': isPromotional,
      'is_visible': isVisible,
      'product_type': productType,
      'image': image,
      'category_id': categoryId,
      'complements': complements?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['toUpdate'] ?? false,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      qtyFlavorsPizza: map['qty_flavors_pizza'] != null ? QtyFlavorsPizza.values.firstWhere((element) => map['qty_flavors_pizza']) : null,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      isPromotional: map['is_promotional'] ?? false,
      isVisible: map['is_visible'] ?? false,
      productType: ProductType.values.firstWhere((element) => map['product_type']),
      image: map['image'],
      categoryId: map['category_id']?.toInt(),
      complements: map['complements'] != null ? List<ComplementModel>.from(map['complements']?.map(ComplementModel.fromMap)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
