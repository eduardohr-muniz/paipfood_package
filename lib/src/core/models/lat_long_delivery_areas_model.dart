import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/provider/global_variables.dart';

class LatLongDeliveryAreasModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? establishmentId;
  final int? id;
  final double latitude;
  final double longitude;
  final int deleveryAreaId;
  final LatLng? latLng;
  LatLongDeliveryAreasModel({
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId = '',
    this.id,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.deleveryAreaId = 0,
    this.latLng,
  });

  LatLongDeliveryAreasModel copyWith({
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<DateTime?>? updatedAt,
    bool? toUpdate,
    ValueGetter<String?>? establishmentId,
    ValueGetter<int?>? id,
    double? latitude,
    double? longitude,
    int? deleveryAreaId,
    LatLng? latLng,
  }) {
    return LatLongDeliveryAreasModel(
      createdAt: createdAt?.call() ?? this.createdAt,
      updatedAt: updatedAt?.call() ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId?.call() ?? this.establishmentId,
      id: id?.call() ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      deleveryAreaId: deleveryAreaId ?? this.deleveryAreaId,
      latLng: latLng ?? this.latLng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'toUpdate': toUpdate,
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'delevery_area_id': deleveryAreaId,
    };
  }

  factory LatLongDeliveryAreasModel.fromMap(Map<String, dynamic> map) {
    return LatLongDeliveryAreasModel(
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['toUpdate'] ?? false,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      deleveryAreaId: map['delevery_area_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLongDeliveryAreasModel.fromJson(String source) => LatLongDeliveryAreasModel.fromMap(json.decode(source));
}
