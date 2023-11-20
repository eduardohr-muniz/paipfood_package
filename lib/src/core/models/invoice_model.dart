import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../provider/global_variables.dart';
import 'zz_models_export.dart';

class InvoiceModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final int? establishmentId;
  final int? id;
  final PlansModel? plan;
  final double? planPrice;
  final DateTime? dueDate;
  final String? status;
  final double? tax;
  final double? amount;
  final DateTime? renegotiationDate;
  final double? customPlanPrice;
  final DateTime? paymentDate;
  final String? paymentMethod;
  final String? transactionId;
  InvoiceModel({
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.plan,
    this.planPrice,
    this.dueDate,
    this.status,
    this.tax,
    this.amount,
    this.renegotiationDate,
    this.customPlanPrice,
    this.paymentDate,
    this.paymentMethod,
    this.transactionId,
  });

  InvoiceModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    int? establishmentId,
    int? id,
    PlansModel? plan,
    double? planPrice,
    DateTime? dueDate,
    String? status,
    double? tax,
    double? amount,
    DateTime? renegotiationDate,
    double? customPlanPrice,
    DateTime? paymentDate,
    String? paymentMethod,
    String? transactionId,
  }) {
    return InvoiceModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      plan: plan ?? this.plan,
      planPrice: planPrice ?? this.planPrice,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      tax: tax ?? this.tax,
      amount: amount ?? this.amount,
      renegotiationDate: renegotiationDate ?? this.renegotiationDate,
      customPlanPrice: customPlanPrice ?? this.customPlanPrice,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId,
      'id': id,
      'plan': plan?.toMap(),
      'plan_price': planPrice,
      'due_date': dueDate?.toIso8601String(),
      'status': status,
      'tax': tax,
      'amount': amount,
      'renegotiation_date': renegotiationDate?.toIso8601String(),
      'custom_plan_price': customPlanPrice,
      'payment_date': paymentDate?.toIso8601String(),
      'payment_method': paymentMethod,
      'transaction_id': transactionId,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      plan: map['plan'] != null ? PlansModel.fromMap(map['plan']) : null,
      planPrice: map['plan_price']?.toDouble(),
      dueDate: map['due_date'] != null ? DateTime.parse(map['due_date']) : null,
      status: map['status'],
      tax: map['tax']?.toDouble(),
      amount: map['amount']?.toDouble(),
      renegotiationDate: map['renegotiation_date'] != null ? DateTime.parse(map['renegotiation_date']) : null,
      customPlanPrice: map['custom_plan_price']?.toDouble(),
      paymentDate: map['payment_date'] != null ? DateTime.parse(map['payment_date']) : null,
      paymentMethod: map['payment_method'],
      transactionId: map['transaction_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) => InvoiceModel.fromMap(json.decode(source));
}
