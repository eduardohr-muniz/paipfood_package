import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class LatLongModel {
  final String id;
  final String deliveryAreaId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String establishmentId;
  final LatLng latLng;
  SyncState syncState;
  bool isDeleted;
  LatLongModel({
    required this.id,
    required this.latLng,
    required this.establishmentId,
    required this.deliveryAreaId,
    this.createdAt,
    this.updatedAt,
    this.syncState = SyncState.none,
    this.isDeleted = false,
  });

  LatLongModel copyWith({
    String? id,
    String? deliveryAreaId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? establishmentId,
    LatLng? latLng,
    SyncState? syncState,
    bool? isDeleted,
  }) {
    return LatLongModel(
      id: id ?? this.id,
      deliveryAreaId: deliveryAreaId ?? this.deliveryAreaId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      establishmentId: establishmentId ?? this.establishmentId,
      latLng: latLng ?? this.latLng,
      syncState: syncState ?? this.syncState,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': DateTime.now().toIso8601String(),
      'delivery_area_id': deliveryAreaId,
      'establishment_id': establishmentId,
      'lat': latLng.latitude,
      'long': latLng.longitude,
      'is_deleted': isDeleted,
    };
  }

  factory LatLongModel.fromMap(Map<String, dynamic> map) {
    return LatLongModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      deliveryAreaId: map['delivery_area_id'],
      establishmentId: map['establishment_id'],
      latLng: LatLng(
        double.parse(map['lat'].toString()),
        double.parse(map['long'].toString()),
      ),
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLongModel.fromJson(String source) => LatLongModel.fromMap(json.decode(source));
}
