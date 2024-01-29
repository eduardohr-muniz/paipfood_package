import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class CartProductVm {
  final String id;
  final ProductModel product;
  SizeModel? size;

  ///<complementId, <itemId, ItemCart>>
  Map<String, Map<String, ItemCart>> itemsCartMap;
  String observation;
  int qty;
  double price;
  QtyFlavorsPizza? qtyFlavorsPizza;

  CartProductVm({
    required this.id,
    required this.product,
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
      itemsCartMap: Map<String, Map<String, ItemCart>>.from(map['items_cart_map'] ?? const {}),
      observation: map['observation'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductVm.fromJson(String source) => CartProductVm.fromMap(json.decode(source));

  //*----------------------------------------------------------------------------------------------

  // int qtyItemCartByComplement(ComplementModel complement) => itemsCartMap.where((item) => item.complement.id == complement.id).length;
  int qtyItemCartByComplement(ComplementModel complement) => itemsCartMap[complement.id]?.length ?? 0;

  bool containsItem({required ComplementModel complement, required ItemModel item}) {
    return itemsCartMap[complement.id] != null && itemsCartMap[complement.id]![item.id] != null;
  }

  void switchSize(SizeModel size) {
    if (this.size?.id == size.id) return;
    price -= this.size!.getAmount;
    price += size.getAmount;
    this.size = size;
  }

  double get amount => price * qty;
  bool addItem({required ItemModel item, required ComplementModel complement}) {
    final double price_ = getPriceItem(item: item, complement: complement);
    final int qtyActualy = getQtyByItem(item: item, complement: complement);
    bool allowEntries = complementAllowEntries(complement);
    if (complement.isMultiple == false && allowEntries == false) {
      allowEntries = switchItemUnique(item: item, complement: complement, allowEntries: allowEntries);
    }
    if (!allowEntries) return false;
    final qty_ = qtyActualy + 1;
    price += price_;
    if (itemsCartMap[complement.id] == null) itemsCartMap[complement.id] = {};
    itemsCartMap[complement.id]![item.id] = ItemCart.fromItem(
      item: item,
      complement: complement,
      qty: qty_,
      price: price_,
    );
    return true;
  }

  List<ItemModel> getItemsByComplement(ComplementModel complement) {
    if (itemsCartMap[complement.id] == null) return [];
    return itemsCartMap[complement.id]!.values.map((e) => e.item).toList();
  }

  bool switchItemUnique({required ItemModel item, required ComplementModel complement, required bool allowEntries}) {
    if (complement.isMultiple == false || allowEntries == false) {
      final entries = itemsCartMap[complement.id]?.entries ?? {};
      if (entries.isNotEmpty) {
        final firstItem = itemsCartMap[complement.id]!.entries.first.value.item;
        if (firstItem.id != item.id) {
          removeItem(item: firstItem, complement: complement);
          allowEntries = true;
        }
      }
    }
    return allowEntries;
  }

  double getPriceItem({required ItemModel item, required ComplementModel complement}) {
    double price_ = item.getAmount;
    if (complement.complementType == ComplementType.pizza) price_ = item.getPriceSizeByProduct(product) / qtyFlavorsPizza!.qty;
    return price_;
  }
  //pegar a qtd se for 1 segue se não remove a primeira e adiciona essa

  void removeItem({required ItemModel item, required ComplementModel complement}) {
    final double price_ = getPriceItem(item: item, complement: complement);
    final int qty_ = getQtyByItem(item: item, complement: complement);
    price -= price_;
    if (qty_ == 1) {
      itemsCartMap[complement.id]?.remove(item.id);
      return;
    }
    itemsCartMap[complement.id]![item.id] = ItemCart.fromItem(item: item, complement: complement, qty: qty_ - 1, price: price_);
  }

  bool complementAllowEntries(ComplementModel complement) {
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

  int getQtyItemsByComplement(ComplementModel complement) {
    final items = itemsCartMap[complement.id]?.values.toList() ?? [];
    int qtyd = 0;
    for (final item in items) {
      qtyd += item.qty;
    }

    return qtyd;
  }

  void switchQtyFlavorPizza(QtyFlavorsPizza qtyFlavorsPizza) {
    final complementPizza = product.complements.firstWhere((element) => element.complementType == ComplementType.pizza);
    final flavorsPizza = getItemsCartByComplement(complementPizza);
    for (final flavor in flavorsPizza) {
      price -= flavor.price;
      itemsCartMap[complementPizza.id]!.remove(flavor.item.id);
    }
    this.qtyFlavorsPizza = qtyFlavorsPizza;
  }

  List<ItemCart> getItemsCartByComplement(ComplementModel complement) {
    if (itemsCartMap[complement.id] == null) return [];
    return itemsCartMap[complement.id]!.values.toList();
  }

  List<ComplementModel> getComplements() {
    return product.complements.where((element) => itemsCartMap[element.id] != null && itemsCartMap[element.id]!.values.isNotEmpty).toList();
  }

  bool complementIsValid(ComplementModel complement) {
    if (complement.complementType == ComplementType.pizza && getQtyItemsByComplement(complement) >= qtyFlavorsPizza!.qty) return true;
    if (complement.qtyMin < 1 && complement.complementType != ComplementType.pizza) return true;
    if (complement.qtyMin > 1 && getQtyItemsByComplement(complement) >= complement.qtyMin) return true;
    return false;
  }

  int getQtyByItem({required ItemModel item, required ComplementModel complement}) {
    if (itemsCartMap[complement.id] == null) return 0;
    return itemsCartMap[complement.id]![item.id]?.qty ?? 0;
  }
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
  factory ItemCart.fromItem({required ItemModel item, required ComplementModel complement, required int qty, required double price}) {
    return ItemCart(
      id: uuid,
      item: item,
      complement: complement,
      qty: qty,
      price: price,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCart.fromJson(String source) => ItemCart.fromMap(json.decode(source));
}
