import 'dart:convert';
import 'package:paipfood_package/src/core/provider/global_variables.dart';

import 'complement_model.dart';

enum QtyFlavorsPizza {
  one(1, "umSabor"),
  two(2, "doisSabores"),
  tree(3, "tresSabores"),
  four(4, "quatroSabores");

  final int qty;
  final String desc;
  const QtyFlavorsPizza(this.qty, this.desc);
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
  final bool visible;
  final String? image;
  final int? categoryId;
  final List<ComplementModel>? complements;
  final int? complementPizzaId;

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
    this.visible = true,
    this.image,
    this.categoryId,
    this.complements,
    this.complementPizzaId,
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
    bool? visible,
    String? image,
    int? categoryId,
    List<ComplementModel>? complements,
    int? complementPizzaId,
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
      visible: visible ?? this.visible,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      complements: complements ?? this.complements,
      complementPizzaId: complementPizzaId ?? this.complementPizzaId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'qty_flavors_pizza': qtyFlavorsPizza?.qty,
      'name': name,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'is_promotional': isPromotional,
      'visible': visible,
      'image': image,
      'category_id': categoryId,
      'complement_pizza_id': complementPizzaId,
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
      qtyFlavorsPizza:
          map['qty_flavors_pizza'] != null ? QtyFlavorsPizza.values.firstWhere((element) => element.index == map['qty_flavors_pizza']) : null,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      isPromotional: map['is_promotional'] ?? false,
      visible: map['visible'] ?? false,
      image: map['image'],
      categoryId: map['category_id']?.toInt(),
      complements: map['complements'] != null ? List<ComplementModel>.from(map['complements']?.map(ComplementModel.fromMap)) : null,
      complementPizzaId: map['complement_pizza_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
