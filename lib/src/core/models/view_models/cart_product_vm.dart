import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class CartProductVm {
  final String id;
  final ProductModel product;
  SizeModel? size;
  List<ComplementModel> complements;
  List<ItemCart> itemsCart;
  Map<String, Map<String, ItemCart>> itemsCartMap;
  String observation;
  int qty;
  double price;
  QtyFlavorsPizza? qtyFlavorsPizza;

  CartProductVm({
    required this.id,
    required this.product,
    required this.complements,
    required this.itemsCart,
    required this.itemsCartMap,
    this.size,
    this.observation = '',
    this.qty = 1,
    this.price = 0,
    this.qtyFlavorsPizza,
  });

  CartProductVm copyWith({
    String? id,
    ProductModel? product,
    SizeModel? size,
    List<ComplementModel>? complements,
    List<ItemCart>? itemsCart,
    Map<String, Map<String, ItemCart>>? itemsCartMap,
    String? observation,
    int? qty,
    double? price,
    QtyFlavorsPizza? qtyFlavorsPizza,
  }) {
    return CartProductVm(
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      complements: complements ?? this.complements,
      itemsCart: itemsCart ?? this.itemsCart,
      itemsCartMap: itemsCartMap ?? this.itemsCartMap,
      observation: observation ?? this.observation,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      qtyFlavorsPizza: qtyFlavorsPizza ?? this.qtyFlavorsPizza,
    );
  }

  CartProductVm clone() {
    return CartProductVm(
      id: id,
      product: product.clone(),
      size: size?.clone(),
      itemsCartMap: itemsCartMap,
      complements: complements.map((e) => e.clone()).toList(),
      itemsCart: itemsCart.map((e) => e.clone()).toList(),
      observation: observation,
      qty: qty,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'size': size?.toMap(),
      'complements': complements.map((x) => x.toMap()).toList(),
      'items_cart': itemsCart.map((x) => x.toMap()).toList(),
      'observation': observation,
      'items_cart_map': itemsCartMap,
      'qty': qty,
      'price': price,
      'qty_flavors_pizza': qtyFlavorsPizza?.qty,
    };
  }

  factory CartProductVm.fromMap(Map map) {
    return CartProductVm(
      id: map['id'],
      product: ProductModel.fromMap(map['product']),
      size: map['size'] != null ? SizeModel.fromMap(map['size']) : null,
      complements: List<ComplementModel>.from(map['complements']?.map((x) {
            return ComplementModel.fromMap(x);
          }) ??
          const []),
      itemsCart: List<ItemCart>.from(map['items_cart']?.map((x) {
            return ItemCart.fromMap(x);
          }) ??
          const []),
      itemsCartMap: Map<String, Map<String, ItemCart>>.from(map['items_cart_map'] ?? const {}),
      observation: map['observation'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());
  int qtyItemCartByComplement(ComplementModel complement) => itemsCart.where((item) => item.complement.id == complement.id).length;
// preciso verificar se já existe o item
  // preciso verificar a quantidade maxima de itens do complemento
  bool containsItem({required ComplementModel complement, required ItemModel item}) {
    return itemsCartMap[complement.id] != null && itemsCartMap[complement.id]![item.id] != null;
  }

  void addItem({required ItemModel item, required ComplementModel complement}) {
    final double price_ = getPriceItem(item: item, complement: complement);
    final int qtyActualy = getQtyByItem(item: item, complement: complement);
    if (!permiteInserir(complement)) return;
    final qty_ = qtyActualy + 1;
    price += price_;
    if (itemsCartMap[complement.id] == null) itemsCartMap[complement.id] = {};
    itemsCartMap[complement.id]![item.id] = ItemCart.fromItem(item: item, complement: complement, qty: qty_);
  }

  double getPriceItem({required ItemModel item, required ComplementModel complement}) {
    double price_ = item.getAmount;
    if (complement.complementType == ComplementType.pizza) price_ = item.getPriceSizeByProduct(product) / qtyFlavorsPizza!.qty;
    return price_;
  }

  void removeItem({required ItemModel item, required ComplementModel complement}) {
    final double price_ = getPriceItem(item: item, complement: complement);
    final int qty_ = getQtyByItem(item: item, complement: complement);
    price -= price_;
    if (qty_ == 1) {
      itemsCartMap[complement.id]?.remove(item.id);
      return;
    }
    itemsCartMap[complement.id]![item.id] = ItemCart.fromItem(item: item, complement: complement, qty: qty_ - 1);
  }

  bool permiteInserir(ComplementModel complement) {
    int max = complement.qtyMax;
    if (complement.complementType == ComplementType.pizza) max = qtyFlavorsPizza!.qty;

    final items = itemsCartMap[complement.id]?.values.toList() ?? [];
    int qtyd = 0;
    for (final item in items) {
      qtyd += item.qty;
    }
    if ((max == 0 ? 280 : max) > qtyd) return true;
    return false;
  }

  int getQtyByItem({required ItemModel item, required ComplementModel complement}) {
    if (itemsCartMap[complement.id] == null) return 0;
    return itemsCartMap[complement.id]![item.id]?.qty ?? 0;
  }

  factory CartProductVm.fromJson(String source) => CartProductVm.fromMap(json.decode(source));
}

class ItemCart {
  String id;
  ItemModel item;
  ComplementModel complement;
  int qty;
  double price;
  ItemCart({
    required this.id,
    required this.item,
    required this.complement,
    this.qty = 0,
    this.price = 0.0,
  });

  ItemCart copyWith({
    String? id,
    ItemModel? item,
    ComplementModel? complement,
    int? qty,
    double? price,
  }) {
    return ItemCart(
      id: id ?? this.id,
      item: item ?? this.item,
      complement: complement ?? this.complement,
      qty: qty ?? this.qty,
      price: price ?? this.price,
    );
  }

  ItemCart clone() {
    return ItemCart(
      id: id,
      item: item.clone(),
      complement: complement.clone(),
      qty: qty,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item.toMap(),
      'complement': complement.toMap(),
      'qty': qty,
      'price': price,
    };
  }

  factory ItemCart.fromMap(Map map) {
    return ItemCart(
      id: map['id'],
      item: ItemModel.fromMap(map['item']),
      complement: ComplementModel.fromMap(map['complement']),
      qty: map['qty']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }
  factory ItemCart.fromItem({required ItemModel item, required ComplementModel complement, required int qty}) {
    return ItemCart(
      id: uuid,
      item: item,
      complement: complement,
      qty: qty,
      price: item.price,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCart.fromJson(String source) => ItemCart.fromMap(json.decode(source));
}
