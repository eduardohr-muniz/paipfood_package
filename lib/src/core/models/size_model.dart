import 'dart:convert';
import 'package:paipfood_package/paipfood_package.dart';

class SizeModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String establishmentId;
  final String id;
  final String? itemId;
  final String productId;
  double price;
  double? promotionalPrice;
  bool isDeleted;
  bool isPreSelected;
  SyncState syncState;
  String name;
  String description;
  SizeType sizeType;
  ItemModel? product;
  ItemModel? item;
  SizeModel({
    required this.id,
    required this.establishmentId,
    required this.productId,
    required this.price,
    this.name = '',
    this.description = '',
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.promotionalPrice,
    this.product,
    this.item,
    this.syncState = SyncState.none,
    this.isDeleted = false,
    this.isPreSelected = false,
    this.sizeType = SizeType.product,
  });

  SizeModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? establishmentId,
    String? id,
    String? itemId,
    String? productId,
    double? price,
    double? promotionalPrice,
    ItemModel? product,
    ItemModel? item,
    bool? isDeleted,
    bool? isPreSelected,
    SyncState? syncState,
    String? name,
    String? description,
    SizeType? sizeType,
  }) {
    return SizeModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      product: product ?? this.product,
      item: item ?? this.item,
      isDeleted: isDeleted ?? this.isDeleted,
      isPreSelected: isPreSelected ?? this.isPreSelected,
      syncState: syncState ?? this.syncState,
      name: name ?? this.name,
      description: description ?? this.description,
      sizeType: sizeType ?? this.sizeType,
    );
  }

  SizeModel clone() {
    return SizeModel(
      createdAt: createdAt,
      updatedAt: updatedAt,
      establishmentId: establishmentId,
      id: id,
      itemId: itemId,
      productId: productId,
      price: price,
      promotionalPrice: promotionalPrice,
      product: product,
      item: item,
      isDeleted: isDeleted,
      isPreSelected: isPreSelected,
      syncState: syncState,
      name: name,
      description: description,
      sizeType: sizeType,
    );
  }

  static const String box = "sizes";
  Map<String, dynamic> toMap({bool isComplete = true}) {
    final map = {
      'id': id,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'item_id': itemId,
      'product_id': productId,
      'price': price,
      'promotional_price': promotionalPrice,
      'is_deleted': isDeleted,
      'name': name,
      'description': description,
      'is_pre_selected': isPreSelected,
      'size_type': sizeType.name,
    };
    final mapComplete = {
      "product": product?.toMap(),
      "item": item?.toMap(),
      "sync_state": syncState.name,
    };
    if (isComplete) map.addAll(mapComplete);
    return map;
  }

  factory SizeModel.fromMap(Map map) {
    return SizeModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      itemId: map['item_id'],
      productId: map['product_id'],
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isDeleted: map['is_deleted'] ?? false,
      isPreSelected: map['is_pre_selected'] ?? false,
      sizeType: SizeType.values.firstWhere((element) => element.name == map['size_type'], orElse: () => SizeType.product),
      product: map['product'] != null ? ItemModel.fromMap(map['product']) : null,
      item: map['item'] != null ? ItemModel.fromMap(map['item']) : null,
      syncState: map['sync_state'] != null
          ? SyncState.values.firstWhere((element) => element.name == map['sync_state'], orElse: () => SyncState.none)
          : SyncState.none,
    );
  }

  String toJson() => json.encode(toMap());

  double get getAmount {
    if (promotionalPrice != null && promotionalPrice! > 0.1) return promotionalPrice!;
    return price;
  }

  factory SizeModel.fromJson(String source) => SizeModel.fromMap(json.decode(source));
}
