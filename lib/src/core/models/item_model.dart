import 'dart:convert';
import 'dart:typed_data';

import 'package:paipfood_package/paipfood_package.dart';

enum Itemtype {
  item,
  pizza;
}

class ItemModel {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String establishmentId;
  int index;
  String name;
  String nickName;
  String description;
  double price;
  double promotionalPrice;
  double? priceFrom;
  String? image;
  Uint8List? imageBytes;
  bool isPreSelected;
  String complementId;
  bool visible;
  List<SizeModel> sizes;
  Itemtype itemtype;
  bool isDeleted;
  SyncState syncState;

  ItemModel({
    required this.id,
    required this.index,
    required this.establishmentId,
    required this.complementId,
    required this.sizes,
    this.createdAt,
    this.updatedAt,
    this.name = '',
    this.nickName = '',
    this.description = '',
    this.price = 0.0,
    this.promotionalPrice = 0.0,
    this.priceFrom,
    this.image,
    this.imageBytes,
    this.isPreSelected = false,
    this.visible = true,
    this.itemtype = Itemtype.item,
    this.isDeleted = false,
    this.syncState = SyncState.none,
  });
  static const String box = "items";
  ItemModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? establishmentId,
    int? index,
    String? name,
    String? nickName,
    String? description,
    double? price,
    double? promotionalPrice,
    double? priceFrom,
    String? image,
    Uint8List? imageBytes,
    bool? isPreSelected,
    String? complementId,
    bool? visible,
    List<SizeModel>? sizes,
    Itemtype? itemtype,
    bool? isDeleted,
    SyncState? syncState,
  }) {
    return ItemModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      establishmentId: establishmentId ?? this.establishmentId,
      index: index ?? this.index,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      description: description ?? this.description,
      price: price ?? this.price,
      promotionalPrice: promotionalPrice ?? this.promotionalPrice,
      priceFrom: priceFrom ?? this.priceFrom,
      image: image ?? this.image,
      imageBytes: imageBytes ?? this.imageBytes,
      isPreSelected: isPreSelected ?? this.isPreSelected,
      complementId: complementId ?? this.complementId,
      visible: visible ?? this.visible,
      sizes: sizes ?? this.sizes,
      itemtype: itemtype ?? this.itemtype,
      isDeleted: isDeleted ?? this.isDeleted,
      syncState: syncState ?? this.syncState,
    );
  }

  ItemModel clone() {
    return ItemModel(
      index: index,
      createdAt: createdAt,
      updatedAt: updatedAt,
      establishmentId: establishmentId,
      id: id,
      name: name,
      nickName: nickName,
      description: description,
      price: price,
      promotionalPrice: promotionalPrice,
      priceFrom: priceFrom,
      image: image,
      imageBytes: imageBytes,
      isPreSelected: isPreSelected,
      complementId: complementId,
      visible: visible,
      sizes: sizes.map((e) => e.clone()).toList(),
      itemtype: itemtype,
      isDeleted: isDeleted,
      syncState: syncState,
    );
  }

//  List<SizeModel> sizes;
  Map<String, dynamic> toMap({bool isComplete = true}) {
    final map = {
      'id': id,
      'index': index,
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'name': name,
      'nick_name': nickName,
      'description': description,
      'price': price,
      'promotional_price': promotionalPrice,
      'image': image,
      'is_pre_selected': isPreSelected,
      'complement_id': complementId,
      'visible': visible,
      'item_type': itemtype.name,
      'is_deleted': isDeleted,
      'price_from': priceFromPizza
    };
    final mapComplete = {
      SizeModel.box: sizes.map((e) => e.toMap()).toList(),
      'sync_state': syncState.name,
    };
    if (isComplete) map.addAll(mapComplete);
    return map;
  }

  factory ItemModel.fromMap(Map map) {
    return ItemModel(
      id: map['id'],
      complementId: map['complement_id'],
      index: map['index'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      name: map['name'] ?? '',
      nickName: map['nick_name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      promotionalPrice: map['promotional_price']?.toDouble() ?? 0.0,
      priceFrom: map['price_from']?.toDouble(),
      image: map['image'],
      isPreSelected: map['is_pre_selected'],
      visible: map['visible'] ?? false,
      sizes: map['sizes'] != null
          ? List<SizeModel>.from(map['sizes']?.map((e) {
              return SizeModel.fromMap(e);
            }))
          : [],
      itemtype: Itemtype.values.firstWhere((element) => element.name == map['item_type'], orElse: () => Itemtype.item),
      isDeleted: map['is_deleted'] ?? false,
      syncState: map['sync_state'] != null
          ? SyncState.values.firstWhere((element) => element.name == map['sync_state'], orElse: () => SyncState.none)
          : SyncState.none,
    );
  }
  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));

  //*--------------------------------------------------------------------------------------

  String get imagePath => "$establishmentId/$id.png";

  double? get priceFromPizza {
    final list = List.from(sizes);
    if (list.isEmpty) return null;
    return list.sorted((a, b) => a.price.compareTo(b.price)).first.price;
  }

  double getPriceSizeByProduct(ProductModel product) {
    return sizes.firstWhere((element) => element.productId == product.id).getAmount;
  }

  SizeModel? getSizeByProduct(ProductModel product) {
    return sizes.firstWhereOrNull((element) => element.productId == product.id);
  }

  double get getAmount {
    if (promotionalPrice > 0) return promotionalPrice;
    return price;
  }

  List<SizeModel> get sizesAscByPrice => sizes.sorted((a, b) => a.price.compareTo(b.price));
  List<SizeModel> get sizesDescByPrice => sizes.sorted((a, b) => b.price.compareTo(a.price));
}
