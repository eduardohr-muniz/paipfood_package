import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

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
  String id;
  String categoryId;
  String? complementPizzaId;
  int index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool toUpdate;
  String establishmentId;
  QtyFlavorsPizza? qtyFlavorsPizza;
  String name;
  String description;
  double price;
  double promotionalPrice;
  bool isPromotional;
  bool visible;
  String? image;
  List<ComplementModel>? complements;
  bool isDeleted;
  SyncState syncState;
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.index,
    this.complementPizzaId,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId = '',
    this.qtyFlavorsPizza,
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice = 0.0,
    this.isPromotional = false,
    this.visible = false,
    this.image,
    this.complements,
    this.isDeleted = false,
    this.syncState = SyncState.none,
  });

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? complementPizzaId,
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? establishmentId,
    QtyFlavorsPizza? qtyFlavorsPizza,
    String? name,
    String? description,
    double? price,
    double? promotionalPrice,
    bool? isPromotional,
    bool? visible,
    String? image,
    List<ComplementModel>? complements,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      complementPizzaId: complementPizzaId ?? this.complementPizzaId,
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      qtyFlavorsPizza: qtyFlavorsPizza ?? this.qtyFlavorsPizza,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      isPromotional: isPromotional ?? this.isPromotional,
      visible: visible ?? this.visible,
      image: image ?? this.image,
      complements: complements ?? this.complements,
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
      'is_deleted': isDeleted,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      categoryId: map['category_id'],
      complementPizzaId: map['complement_pizza_id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['toUpdate'] ?? false,
      establishmentId: map['establishment_id'],
      qtyFlavorsPizza:
          map['qty_flavors_pizza'] != null ? QtyFlavorsPizza.values.firstWhere((element) => element.index == map['qty_flavors_pizza']) : null,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      isPromotional: map['is_promotional'] ?? false,
      visible: map['visible'] ?? false,
      image: map['image'],
      complements: map['complements'] != null ? List<ComplementModel>.from(map['complements']?.map(ComplementModel.fromMap)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
