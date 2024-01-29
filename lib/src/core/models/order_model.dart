import 'package:paipfood_package/paipfood_package.dart';

class OrderModel {
  String id;
  String establishmentId;
  OrderTypeEnum orderType;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? acceptedDate;
  DateTime? inDeliveryDate;
  DateTime? deliveredDate;
  DateTime? canceledDate;
  DateTime? paymentDate;
  DateTime? paymentConfirmDate;
  StatusOrder status;
  CustomerModel customer;
  List<CartProductVm> cartProducts;
  String paymentMethod;
  double subTotal;
  double amount;
  double deliveryTax;
  double tax;
  double? changeTo;
  String? deliveryAreaId;
  DeliveryAreasModel? deliveryArea;

  OrderModel({
    required this.id,
    required this.establishmentId,
    required this.orderType,
    required this.customer,
    required this.cartProducts,
    this.createdAt,
    this.updatedAt,
    this.acceptedDate,
    this.inDeliveryDate,
    this.deliveredDate,
    this.canceledDate,
    this.paymentDate,
    this.paymentConfirmDate,
    this.status = StatusOrder.peding,
    this.paymentMethod = '',
    this.subTotal = 0.0,
    this.amount = 0.0,
    this.deliveryTax = 0.0,
    this.tax = 0.0,
    this.changeTo,
    this.deliveryAreaId,
    this.deliveryArea,
  });
}
