import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/models/order_invoice.dart';

enum OrderStatusEnum {
  pending,
  accepted,
  inDelivery,
  delivered,
  awaitingPickup,
  canceled,
  forgot;

  static OrderStatusEnum fromMap(String value) => OrderStatusEnum.values.firstWhere((element) => element.name == value);
}

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
  bool isPaid;
  CustomerModel customer;
  List<CartProductVm> cartProducts;
  PaymentMethodModel? paymentMethod;
  double subTotal;
  double amount;
  double deliveryTax;
  double tax;
  double discount;
  double changeTo;
  String? deliveryAreaId;
  DeliveryAreasModel? deliveryArea;
  int? orderNumber;
  OrderInvoice? orderInvoice;
  String? orderInvoiceId;
  String? userId;
  OrderStatusEnum orderStatus;
  bool isPaymentApp;
  bool isLocal;

  OrderModel({
    required this.id,
    required this.establishmentId,
    required this.orderType,
    required this.cartProducts,
    required this.customer,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.acceptedDate,
    this.inDeliveryDate,
    this.deliveredDate,
    this.canceledDate,
    this.isPaid = false,
    this.subTotal = 0.0,
    this.amount = 0.0,
    this.deliveryTax = 0.0,
    this.tax = 0.0,
    this.discount = 0.0,
    this.changeTo = 0.0,
    this.deliveryAreaId,
    this.deliveryArea,
    this.orderNumber,
    this.orderInvoice,
    this.orderInvoiceId,
    this.userId,
    this.orderStatus = OrderStatusEnum.pending,
    this.isPaymentApp = false,
    this.isLocal = false,
  });

  OrderModel copyWith({
    String? id,
    String? establishmentId,
    OrderTypeEnum? orderType,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? acceptedDate,
    DateTime? inDeliveryDate,
    DateTime? deliveredDate,
    DateTime? canceledDate,
    bool? isPaid,
    CustomerModel? customer,
    List<CartProductVm>? cartProducts,
    PaymentMethodModel? paymentMethod,
    double? subTotal,
    double? amount,
    double? deliveryTax,
    double? tax,
    double? discount,
    double? changeTo,
    String? deliveryAreaId,
    DeliveryAreasModel? deliveryArea,
    int? orderNumber,
    OrderInvoice? orderInvoice,
    String? orderInvoiceId,
    String? userId,
    OrderStatusEnum? orderStatus,
    bool? isPaymentApp,
    bool? isLocal,
  }) {
    return OrderModel(
      id: id ?? this.id,
      establishmentId: establishmentId ?? this.establishmentId,
      orderType: orderType ?? this.orderType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      acceptedDate: acceptedDate ?? this.acceptedDate,
      inDeliveryDate: inDeliveryDate ?? this.inDeliveryDate,
      deliveredDate: deliveredDate ?? this.deliveredDate,
      canceledDate: canceledDate ?? this.canceledDate,
      isPaid: isPaid ?? this.isPaid,
      customer: customer ?? this.customer,
      cartProducts: cartProducts ?? this.cartProducts,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      subTotal: subTotal ?? this.subTotal,
      amount: amount ?? this.amount,
      deliveryTax: deliveryTax ?? this.deliveryTax,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      changeTo: changeTo ?? this.changeTo,
      deliveryAreaId: deliveryAreaId ?? this.deliveryAreaId,
      deliveryArea: deliveryArea ?? this.deliveryArea,
      orderNumber: orderNumber ?? this.orderNumber,
      orderInvoice: orderInvoice ?? this.orderInvoice,
      orderInvoiceId: orderInvoiceId ?? this.orderInvoiceId,
      userId: userId ?? this.userId,
      orderStatus: orderStatus ?? this.orderStatus,
      isPaymentApp: isPaymentApp ?? this.isPaymentApp,
      isLocal: isLocal ?? this.isLocal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt != null ? createdAt!.toTimesTamptzFormat : DateTime.now().toTimesTamptzFormat,
      'establishment_id': establishmentId,
      'order_type': orderType.name,
      'updated_at': DateTime.now().toTimesTamptzFormat,
      'accepted_date': acceptedDate?.toTimesTamptzFormat,
      'in_delivery_date': inDeliveryDate?.toTimesTamptzFormat,
      'delivered_date': deliveredDate?.toTimesTamptzFormat,
      'canceled_date': canceledDate?.toTimesTamptzFormat,
      'is_paid': isPaid,
      'customer': customer.toMap(),
      'cart_products': cartProducts.map((x) => x.toMap()).toList(),
      'payment_method': paymentMethod!.toMap(),
      'sub_total': getSubTotal,
      'amount': getAmount,
      'delivery_tax': deliveryTax > 0.0 ? deliveryTax : (deliveryArea?.price ?? 0.0),
      'tax': tax,
      'discount': discount,
      'change_to': changeTo,
      'delivery_area_id': deliveryAreaId,
      'delivery_area': deliveryArea?.toMap(),
      'order_number': orderNumber,
      //'orderInvoice': orderInvoice?.toMap(),
      'order_invoice_id': orderInvoiceId,
      'user_id': userId,
      'order_status': orderStatus.name,
      'is_payment_app': isPaymentApp,
      'is_local': isLocal,
    };
  }

  factory OrderModel.fromMap(Map map) {
    return OrderModel(
        id: map['id'] ?? '',
        establishmentId: map['establishment_id'] ?? '',
        orderType: OrderTypeEnum.fromMap(map['order_type']),
        createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
        updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
        acceptedDate: map['accepted_date'] != null ? DateTime.parse(map['accepted_date']) : null,
        inDeliveryDate: map['in_delivery_date'] != null ? DateTime.parse(map['in_delivery_date']) : null,
        deliveredDate: map['delivered_date'] != null ? DateTime.parse(map['delivered_date']) : null,
        canceledDate: map['canceled_date'] != null ? DateTime.parse(map['canceled_date']) : null,
        isPaid: map['is_paid'] ?? false,
        customer: CustomerModel.fromMap(map['customer']),
        cartProducts: List<CartProductVm>.from(map['cart_products']?.map((x) => CartProductVm.fromMap(x)) ?? const []),
        paymentMethod: PaymentMethodModel.fromMap(map['payment_method']),
        subTotal: map['sub_total']?.toDouble() ?? 0.0,
        amount: map['amount']?.toDouble() ?? 0.0,
        deliveryTax: map['delivery_tax']?.toDouble() ?? 0.0,
        tax: map['tax']?.toDouble() ?? 0.0,
        discount: map['discount']?.toDouble() ?? 0.0,
        changeTo: map['change_to']?.toDouble(),
        deliveryAreaId: map['delivery_area_id'],
        deliveryArea: map['delivery_area'] != null ? DeliveryAreasModel.fromMap(map['delivery_area']) : null,
        orderNumber: map['order_number']?.toInt(),
        orderInvoice: map['order_invoice'],
        orderInvoiceId: map['order_invoice_id'],
        userId: map['user_id'],
        orderStatus: OrderStatusEnum.fromMap(map['order_status']),
        isPaymentApp: map['is_payment_app'] ?? false,
        isLocal: map['is_local'] ?? false);
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  double get getCartAmount => cartProducts.fold(0.0, (previousValue, element) => previousValue + element.amount);
  double get getSubTotal {
    double total = 0.0;
    total += getCartAmount;
    if (orderType == OrderTypeEnum.delivery) total += deliveryArea?.price ?? 0.0;
    return total;
  }

  double get getAmount => getSubTotal - discount;
  double get getChange => changeTo - getAmount;

  void setPrices() {
    this
      ..subTotal = getSubTotal
      ..amount;
  }
}
