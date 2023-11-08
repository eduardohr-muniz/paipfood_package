import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:paipfood_package/src/core/provider/global_variables.dart';
import 'lat_long_delivery_areas_model.dart';

class DeliveryAreasModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? establishmentId;
  final bool toUpdate;
  final int? id;
  final String color;
  final String state;
  final String country;
  final double? latitude;
  final double? longitude;
  final List<LatLongDeliveryAreasModel> latLongDeliveryAreasModel;
  final String label;
  final double price;
  final String city;
  DeliveryAreasModel({
    this.createdAt,
    this.updatedAt,
    this.establishmentId,
    this.toUpdate = false,
    this.id,
    this.color = '',
    this.state = '',
    this.country = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.latLongDeliveryAreasModel = const [],
    this.label = '',
    this.price = 0.0,
    this.city = '',
  });

  DeliveryAreasModel copyWith({
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<DateTime?>? updatedAt,
    ValueGetter<String?>? establishmentId,
    bool? toUpdate,
    ValueGetter<int?>? id,
    String? color,
    String? state,
    String? country,
    ValueGetter<double?>? latitude,
    ValueGetter<double?>? longitude,
    List<LatLongDeliveryAreasModel>? latLongDeliveryAreasModel,
    String? label,
    double? price,
    String? city,
  }) {
    return DeliveryAreasModel(
      createdAt: createdAt?.call() ?? this.createdAt,
      updatedAt: updatedAt?.call() ?? this.updatedAt,
      establishmentId: establishmentId?.call() ?? this.establishmentId,
      toUpdate: toUpdate ?? this.toUpdate,
      id: id?.call() ?? this.id,
      color: color ?? this.color,
      state: state ?? this.state,
      country: country ?? this.country,
      latitude: latitude?.call() ?? this.latitude,
      longitude: longitude?.call() ?? this.longitude,
      latLongDeliveryAreasModel: latLongDeliveryAreasModel ?? this.latLongDeliveryAreasModel,
      label: label ?? this.label,
      price: price ?? this.price,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'color': color,
      'state': state,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'lat_long_delivery_areas_model': latLongDeliveryAreasModel.map((x) => x.toMap()).toList(),
      'label': label,
      'price': price,
      'city': city,
    };
  }

  factory DeliveryAreasModel.fromMap(Map<String, dynamic> map) {
    return DeliveryAreasModel(
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      color: map['color'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      latLongDeliveryAreasModel:
          List<LatLongDeliveryAreasModel>.from(map['lat_long_delivery_areas_model']?.map(LatLongDeliveryAreasModel.fromMap) ?? const []),
      label: map['label'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAreasModel.fromJson(String source) => DeliveryAreasModel.fromMap(json.decode(source));
}