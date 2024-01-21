import 'package:paipfood_package/paipfood_package.dart';

class OrderModel {
  String id;
  String establishmentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String status;
  double tax;
  DeliveryAreasModel? deliveryArea;
  double deliveryTax;
  double amount;
  List<CartProductVm> cartProducts;
  OrderModel({
    required this.id,
    required this.cartProducts,
    required this.establishmentId,
    this.createdAt,
    this.updatedAt,
    this.status = '',
    this.tax = 0.0,
    this.deliveryArea,
    this.deliveryTax = 0.0,
    this.amount = 0.0,
  });
}
