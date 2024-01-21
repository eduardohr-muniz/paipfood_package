import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class CategoryModel {
  final String id;
  final String establishmentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  int index;
  String name;
  String description;
  bool visible;
  String image;
  bool isDeleted;
  CategoryType categoryType;
  SyncState syncState;
  List<ProductModel> products;
  CategoryModel({
    required this.id,
    required this.establishmentId,
    required this.index,
    this.products = const [],
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.description = '',
    this.visible = true,
    this.image = '',
    this.categoryType = CategoryType.product,
    this.syncState = SyncState.none,
    this.isDeleted = false,
  });
  static const String box = "categories";
  CategoryModel copyWith({
    String? id,
    String? establishmentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? index,
    String? name,
    String? description,
    bool? visible,
    String? image,
    CategoryType? categoryType,
    List<ProductModel>? products,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      establishmentId: establishmentId ?? this.establishmentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      index: index ?? this.index,
      name: name ?? this.name,
      description: description ?? this.description,
      visible: visible ?? this.visible,
      image: image ?? this.image,
      categoryType: categoryType ?? this.categoryType,
      products: products ?? this.products,
      isDeleted: isDeleted ?? this.isDeleted,
      syncState: syncState ?? this.syncState,
    );
  }

  CategoryModel clone() {
    return CategoryModel(
      id: id,
      establishmentId: establishmentId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      index: index,
      name: name,
      description: description,
      visible: visible,
      image: image,
      categoryType: categoryType,
      products: products.map((e) => e.clone()).toList(),
      isDeleted: isDeleted,
      syncState: syncState,
    );
  }

  Map<String, dynamic> toMap({bool isComplete = true}) {
    final map = {
      'id': id,
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'name': name,
      'description': description,
      'visible': visible,
      'image': image,
      'category_type': categoryType.name,
      'is_deleted': isDeleted,
    };
    final addComplete = {
      ProductModel.box: products.map((e) => e.toMap()).toList(),
      'sync_state': syncState.name,
    };
    if (isComplete) map.addAll(addComplete);
    return map;
  }

  factory CategoryModel.fromMap(Map map) {
    return CategoryModel(
      id: map['id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      visible: map['visible'] ?? false,
      image: map['image'] ?? '',
      categoryType: CategoryType.values.firstWhere((element) => element.name == map['category_type'], orElse: () => CategoryType.product),
      products: map[ProductModel.box] != null
          ? List<ProductModel>.from(map[ProductModel.box]?.map((e) {
              return ProductModel.fromMap(e);
            }))
          : [],
      isDeleted: map['is_deleted'] ?? false,
      syncState: map['sync_state'] != null
          ? SyncState.values.firstWhere((element) => element.name == map['sync_state'], orElse: () => SyncState.none)
          : SyncState.none,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  List<String> imageProducts() {
    final List<String> results = [];
    products.map((e) {
      if (e.image != null) results.add(e.image!);
    }).toList();
    return results;
  }

  List<String> get idsProducts => products.map((e) => e.id).toList();

  ProductModel? productById(String id) {
    return products.firstWhereOrNull((e) => e.id == id);
  }

  List<String> idsSizesFromPorducts() {
    final List<String> ids = [];
    products.map((e) {
      ids.addAll(e.sizesIds);
    }).toList();
    return ids;
  }
}
