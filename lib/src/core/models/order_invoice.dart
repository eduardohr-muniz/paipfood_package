import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class OrderInvoice {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? dateApproved;
  final DateTime? dateRefunded;
  final PaymentStatus paymentStatus;
  final String establishmentId;
  final double value;
  final double? tax;
  final double amount;
  final PaymentFlagEnum paymentFlag;
  final String? paymentId;
  final String? userId;
  final String? qrCodeCopyPaste;
  final String? qrCodeBase64;
  OrderInvoice({
    required this.createdAt,
    required this.updatedAt,
    required this.paymentFlag,
    required this.id,
    required this.establishmentId,
    required this.value,
    required this.amount,
    this.paymentStatus = PaymentStatus.peding,
    this.tax,
    this.paymentId,
    this.userId,
    this.qrCodeCopyPaste,
    this.qrCodeBase64,
    this.dateApproved,
    this.dateRefunded,
  });

  OrderInvoice copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? dateApproved,
    DateTime? dateRefunded,
    PaymentStatus? paymentStatus,
    String? establishmentId,
    double? value,
    double? tax,
    double? amount,
    PaymentFlagEnum? paymentFlag,
    String? paymentId,
    String? userId,
    String? qrCodeCopyPaste,
    String? qrCodeBase64,
  }) {
    return OrderInvoice(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      dateApproved: dateApproved ?? this.dateApproved,
      dateRefunded: dateRefunded ?? this.dateRefunded,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      establishmentId: establishmentId ?? this.establishmentId,
      value: value ?? this.value,
      tax: tax ?? this.tax,
      amount: amount ?? this.amount,
      paymentFlag: paymentFlag ?? this.paymentFlag,
      paymentId: paymentId ?? this.paymentId,
      userId: userId ?? this.userId,
      qrCodeCopyPaste: qrCodeCopyPaste ?? this.qrCodeCopyPaste,
      qrCodeBase64: qrCodeBase64 ?? this.qrCodeBase64,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.toTimesTamptzFormat,
      'updatedAt': updatedAt.toTimesTamptzFormat,
      'paymentStatus': paymentStatus.name,
      'establishmentId': establishmentId,
      'value': value,
      'tax': tax,
      'amount': amount,
      'paymentFlag': paymentFlag.name,
      'paymentId': paymentId,
      'userId': userId,
      'qr_code_copy_paste': qrCodeCopyPaste,
      'qr_code_base64': qrCodeBase64,
      'date_approved': dateApproved?.toTimesTamptzFormat,
      'date_refunded': dateRefunded?.toTimesTamptzFormat,
    };
  }

  factory OrderInvoice.fromMap(Map<String, dynamic> map) {
    return OrderInvoice(
      id: map['id'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      paymentStatus: PaymentStatus.fromMap(map['paymentStatus']),
      establishmentId: map['establishmentId'] ?? '',
      value: map['value'] ?? 0.0,
      tax: map['tax'] ?? 0.0,
      amount: map['amount'] ?? 0.0,
      paymentFlag: PaymentFlagEnum.fromMap(map['paymentFlag']),
      paymentId: map['paymentId'],
      userId: map['userId'],
      qrCodeCopyPaste: map['qr_code_copy_paste'],
      qrCodeBase64: map['qr_code_base64'],
      dateApproved: map['date_approved'] != null ? DateTime.parse(map['date_approved']) : null,
      dateRefunded: map['date_refunded'] != null ? DateTime.parse(map['date_refunded']) : null,
    );
  }
  factory OrderInvoice.fromMercadoPagoPix(Map<String, dynamic> map) {
    return OrderInvoice(
      id: uuid,
      createdAt: DateTime.parse(map['date_created']),
      updatedAt: DateTime.parse(map['date_created']),
      dateApproved: map['date_approved'] != null ? DateTime.parse(map['date_approved']) : null,
      dateRefunded: map['date_refunded'] != null ? DateTime.parse(map['date_refunded']) : null,
      // paymentStatus: PaymentStatus.peding,
      establishmentId: '',
      value: 0.0,
      tax: 0.0,
      amount: 0.0,
      paymentFlag: PaymentFlagEnum.pix,
      paymentId: map['id'],
      userId: '',
      qrCodeCopyPaste: map['point_of_interaction']['transaction_data']['qr_code'],
      qrCodeBase64: map['point_of_interaction']['transaction_data']['qr_code_base64'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderInvoice.fromJson(String source) => OrderInvoice.fromMap(json.decode(source));
}
