import 'dart:convert';
import 'dart:typed_data';

import 'package:paipfood_package/paipfood_package.dart';

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
  final String id;
  final String categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String establishmentId;
  int index;
  QtyFlavorsPizza? qtyFlavorsPizza;
  String name;
  String description;
  double price;
  double? promotionalPrice;
  bool visible;
  String? image;
  bool isDeleted;
  bool isPizza;
  SyncState syncState;
  List<String> complementsIds;
  List<ComplementModel> complements;
  List<SizeModel> sizes;
  double? priceFrom;
  Uint8List? imageBytes;
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.index,
    required this.sizes,
    required this.complements,
    required this.complementsIds,
    required this.establishmentId,
    this.createdAt,
    this.updatedAt,
    this.qtyFlavorsPizza,
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice,
    this.visible = true,
    this.image,
    this.isDeleted = false,
    this.isPizza = false,
    this.syncState = SyncState.none,
    this.priceFrom,
    this.imageBytes,
  });
  static const String box = "products";
  ProductModel copyWith({
    String? id,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? establishmentId,
    int? index,
    QtyFlavorsPizza? qtyFlavorsPizza,
    String? name,
    String? description,
    double? price,
    double? promotionalPrice,
    bool? visible,
    String? image,
    bool? isDeleted,
    bool? isPizza,
    SyncState? syncState,
    List<String>? complementsIds,
    List<ComplementModel>? complements,
    List<SizeModel>? sizes,
    double? priceFrom,
    Uint8List? imageBytes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      establishmentId: establishmentId ?? this.establishmentId,
      index: index ?? this.index,
      qtyFlavorsPizza: qtyFlavorsPizza ?? this.qtyFlavorsPizza,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      visible: visible ?? this.visible,
      image: image ?? this.image,
      isDeleted: isDeleted ?? this.isDeleted,
      isPizza: isPizza ?? this.isPizza,
      syncState: syncState ?? this.syncState,
      complementsIds: complementsIds ?? this.complementsIds,
      complements: complements ?? this.complements,
      sizes: sizes ?? this.sizes,
      priceFrom: priceFrom ?? this.priceFrom,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }

  ProductModel clone() {
    return ProductModel(
      id: id,
      categoryId: categoryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      index: index,
      establishmentId: establishmentId,
      qtyFlavorsPizza: qtyFlavorsPizza,
      name: name,
      description: description,
      price: price,
      promotionalPrice: promotionalPrice,
      visible: visible,
      isPizza: isPizza,
      image: image,
      isDeleted: isDeleted,
      syncState: syncState,
      complementsIds: List.from(complementsIds),
      complements: complements.map((e) => e.clone()).toList(),
      sizes: sizes.map((e) => e.clone()).toList(),
      priceFrom: priceFrom,
      imageBytes: imageBytes,
    );
  }

// List<ComplementModel> complements;
  // List<SizeModel> sizes;
  Map<String, dynamic> toMap({bool isComplete = true}) {
    final map = {
      'id': id,
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'qty_flavors_pizza': qtyFlavorsPizza?.qty,
      'name': name,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'visible': visible,
      'image': image,
      'category_id': categoryId,
      'is_pizza': isPizza,
      'complements_ids': complements.map((e) => e.id).toList(),
      'is_deleted': isDeleted,
      'price_from': priceFrom,
    };
    final mapIsComplete = {
      'sync_state': syncState.name,
    };
    if (isComplete) map.addAll(mapIsComplete);
    return map;
  }

  factory ProductModel.fromMap(Map map) {
    return ProductModel(
      id: map['id'],
      categoryId: map['category_id'],
      isPizza: map['is_pizza'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      qtyFlavorsPizza:
          map['qty_flavors_pizza'] != null ? QtyFlavorsPizza.values.firstWhereOrNull((element) => element.qty == map['qty_flavors_pizza']) : null,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      visible: map['visible'] ?? false,
      image: map['image'],
      priceFrom: map['price_from']?.toDouble(),
      isDeleted: map['is_deleted'] ?? false,
      complementsIds: map['complements_ids'] != null ? List<String>.from(map['complements_ids']) : [],
      complements: map[ComplementModel.box] != null && map[ComplementModel.box]!.isNotEmpty
          ? List<ComplementModel>.from(map[ComplementModel.box]?.map((e) {
              return ComplementModel.fromMap(e);
            }))
          : [],
      sizes: map[SizeModel.box] != null && map[SizeModel.box]!.isNotEmpty
          ? List<SizeModel>.from(map[SizeModel.box]?.map((e) {
              return SizeModel.fromMap(e);
            }))
          : [],
      syncState: map['sync_state'] != null
          ? SyncState.values.firstWhere((element) => element.name == map['sync_state'], orElse: () => SyncState.none)
          : SyncState.none,
    );
  }

  String toJson() => json.encode(toMap());

  List<ItemModel> get getItemsComplements {
    final List<ItemModel> results = [];
    for (final complement in complements) {
      results.addAll(complement.items);
    }
    return results;
  }

  List<QtyFlavorsPizza> get getQtyFlavorsPizza {
    return QtyFlavorsPizza.values.where((e) => e.qty <= qtyFlavorsPizza!.qty).toList();
  }

  String get imagePath => "$establishmentId/$id.png";
  List<String> get sizesIds => sizes.map((e) => e.id).toList();
  double get priceFromSizes => sizes.sorted((a, b) => a.price.compareTo(b.price)).first.price;

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
