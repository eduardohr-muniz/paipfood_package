import 'dart:convert';

import '../provider/global_variables.dart';

class AddressModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String? establishmentId;
  final int? id;
  final String street;
  final String number;
  final String neighborhood;
  final String complement;
  final String zipCode;
  final String state;
  final double latitude;
  final double longitude;
  final String address;
  final String city;
  final String country;
  AddressModel({
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.establishmentId,
    this.id,
    this.street = '',
    this.number = '',
    this.neighborhood = '',
    this.complement = '',
    this.zipCode = '',
    this.state = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.address = '',
    this.city = '',
    this.country = '',
  });

  AddressModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? establishmentId,
    int? id,
    String? street,
    String? number,
    String? neighborhood,
    String? complement,
    String? zipCode,
    String? state,
    double? latitude,
    double? longitude,
    String? address,
    String? city,
    String? country,
  }) {
    return AddressModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      establishmentId: establishmentId ?? this.establishmentId,
      id: id ?? this.id,
      street: street ?? this.street,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      complement: complement ?? this.complement,
      zipCode: zipCode ?? this.zipCode,
      state: state ?? this.state,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.toIso8601String(),
      'updated-at': updatedAt?.toIso8601String(),
      'establishment_id': establishmentId ?? slug,
      'id': id,
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'complement': complement,
      'zip_code': zipCode,
      'state': state,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'city': city,
      'country': country,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['to_update'] ?? false,
      establishmentId: map['establishment_id'],
      id: map['id']?.toInt(),
      street: map['street'] ?? '',
      number: map['number'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      complement: map['complement'] ?? '',
      zipCode: map['zipCode'] ?? '',
      state: map['state'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
