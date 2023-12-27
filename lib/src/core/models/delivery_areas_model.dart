import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class DeliveryAreasModel {
  final String id;
  final DateTime? createdAt;
  final String establishmentId;
  final DateTime? updatedAt;
  Color color;
  String label;
  double price;
  bool isArea;
  double? radius;
  List<LatLongModel> latLongs;
  SyncState syncState;
  bool isDeleted;
  DeliveryAreasModel({
    required this.establishmentId,
    required this.latLongs,
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.color = Colors.red,
    this.label = '',
    this.price = 0.0,
    this.isArea = true,
    this.radius,
    this.syncState = SyncState.none,
    this.isDeleted = false,
  });

  DeliveryAreasModel copyWith({
    String? id,
    DateTime? createdAt,
    String? establishmentId,
    DateTime? updatedAt,
    Color? color,
    String? label,
    double? price,
    bool? isArea,
    double? radius,
    List<LatLongModel>? latLongs,
    SyncState? syncState,
    bool? isDeleted,
  }) {
    return DeliveryAreasModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      establishmentId: establishmentId ?? this.establishmentId,
      updatedAt: updatedAt ?? this.updatedAt,
      color: color ?? this.color,
      label: label ?? this.label,
      price: price ?? this.price,
      isArea: isArea ?? this.isArea,
      radius: radius ?? this.radius,
      latLongs: latLongs ?? this.latLongs,
      syncState: syncState ?? this.syncState,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': DateTime.now().toIso8601String(),
      'establishment_id': establishmentId,
      'color': color.value,
      'label': label,
      'price': price,
      'is_area': isArea,
      'radius': radius,
      'is_deleted': isDeleted,
    };
  }

  factory DeliveryAreasModel.fromMap(Map<String, dynamic> map) {
    return DeliveryAreasModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      color: Color(int.parse(map['color'])),
      label: map['label'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isArea: map['is_area'] ?? false,
      radius: map['radius']?.toDouble(),
      latLongs: [],
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAreasModel.fromJson(String source) => DeliveryAreasModel.fromMap(json.decode(source));
}
