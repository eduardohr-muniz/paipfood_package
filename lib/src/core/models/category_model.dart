import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

enum CategoryType {
  product,
  pizza;
}

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
  CategoryType categoryType;
  List<ProductModel> products;
  bool isDeleted;
  SyncState syncState;
  CategoryModel({
    required this.id,
    required this.establishmentId,
    required this.products,
    required this.index,
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

  Map<String, dynamic> toMap() {
    return {
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
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      visible: map['visible'] ?? false,
      image: map['image'] ?? '',
      categoryType: CategoryType.values.firstWhere((element) => element.name == map['category_type'], orElse: () => CategoryType.product),
      products: [],
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
