import 'dart:convert';
import '../provider/global_variables.dart';
import 'product_model.dart';

enum CategoryType {
  product,
  pizza;
}

class CategoryModel {
  final int? index;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? establishmentId;
  final int? id;
  final String name;
  final String description;
  final bool visible;
  final String image;
  final CategoryType categoryType;
  final List<ProductModel>? products;
  CategoryModel({
    this.index,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.name = '',
    this.description = '',
    this.visible = true,
    this.image = '',
    this.categoryType = CategoryType.product,
    this.products,
  });

  CategoryModel copyWith({
    int? index,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? establishmentId,
    int? id,
    String? name,
    String? description,
    bool? visible,
    String? image,
    CategoryType? categoryType,
    List<ProductModel>? products,
  }) {
    return CategoryModel(
      index: index ?? this.index,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      visible: visible ?? this.visible,
      image: image ?? this.image,
      categoryType: categoryType ?? this.categoryType,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'name': name,
      'description': description,
      'visible': visible,
      'image': image,
      'category_type': categoryType,
      'products': products?.map((x) => x.toMap()).toList(),
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
      categoryType: CategoryType.values.firstWhere((element) => map['category_type'], orElse: () => CategoryType.product),
      products: map['products'] != null ? List<ProductModel>.from(map['products']?.map(ProductModel.fromMap)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
