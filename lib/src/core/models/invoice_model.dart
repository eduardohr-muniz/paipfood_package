import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../provider/global_variables.dart';
import 'paip_models.dart';

class InvoiceModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? establishmentId;
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
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<DateTime?>? updatedAt,
    bool? toUpdate,
    ValueGetter<String?>? establishmentId,
    ValueGetter<int?>? id,
    ValueGetter<PlansModel?>? plan,
    ValueGetter<double?>? planPrice,
    ValueGetter<DateTime?>? dueDate,
    ValueGetter<String?>? status,
    ValueGetter<double?>? tax,
    ValueGetter<double?>? amount,
    ValueGetter<DateTime?>? renegotiationDate,
    ValueGetter<double?>? customPlanPrice,
    ValueGetter<DateTime?>? paymentDate,
    ValueGetter<String?>? paymentMethod,
    ValueGetter<String?>? transactionId,
  }) {
    return InvoiceModel(
      createdAt: createdAt?.call() ?? this.createdAt,
      updatedAt: updatedAt?.call() ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId?.call() ?? this.establishmentId,
      id: id?.call() ?? this.id,
      plan: plan?.call() ?? this.plan,
      planPrice: planPrice?.call() ?? this.planPrice,
      dueDate: dueDate?.call() ?? this.dueDate,
      status: status?.call() ?? this.status,
      tax: tax?.call() ?? this.tax,
      amount: amount?.call() ?? this.amount,
      renegotiationDate: renegotiationDate?.call() ?? this.renegotiationDate,
      customPlanPrice: customPlanPrice?.call() ?? this.customPlanPrice,
      paymentDate: paymentDate?.call() ?? this.paymentDate,
      paymentMethod: paymentMethod?.call() ?? this.paymentMethod,
      transactionId: transactionId?.call() ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'plan': plan?.toMap(),
      'plan_price': planPrice,
      'due_date': dueDate?.millisecondsSinceEpoch,
      'status': status,
      'tax': tax,
      'amount': amount,
      'renegotiation_date': renegotiationDate?.millisecondsSinceEpoch,
      'custom_plan_price': customPlanPrice,
      'payment_date': paymentDate?.millisecondsSinceEpoch,
      'payment_method': paymentMethod,
      'transaction_id': transactionId,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      plan: map['plan'] != null ? PlansModel.fromMap(map['plan']) : null,
      planPrice: map['plan_price']?.toDouble(),
      dueDate: map['due_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['due_date']) : null,
      status: map['status'],
      tax: map['tax']?.toDouble(),
      amount: map['amount']?.toDouble(),
      renegotiationDate: map['renegotiation_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['renegotiation_date']) : null,
      customPlanPrice: map['custom_plan_price']?.toDouble(),
      paymentDate: map['payment_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['payment_date']) : null,
      paymentMethod: map['payment_method'],
      transactionId: map['transaction_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) => InvoiceModel.fromMap(json.decode(source));
}
