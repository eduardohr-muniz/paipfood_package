import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class AddressModel {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String street;
  String number;
  String neighborhood;
  String complement;
  String zipCode;
  String state;
  double lat;
  double long;
  String address;
  String city;
  String country;
  final String? userId;
  final String? establishmentId;
  SyncState syncState;
  bool isDeleted;
  AddressModel({
    required this.id,
    this.lat = 0,
    this.long = 0,
    this.createdAt,
    this.updatedAt,
    this.street = "",
    this.number = "",
    this.neighborhood = "",
    this.complement = "",
    this.zipCode = "",
    this.state = "",
    this.address = "",
    this.city = "",
    this.country = "",
    this.userId,
    this.establishmentId,
    this.syncState = SyncState.none,
    this.isDeleted = false,
  });

  AddressModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? street,
    String? number,
    String? neighborhood,
    String? complement,
    String? zipCode,
    String? state,
    double? lat,
    double? long,
    String? address,
    String? city,
    String? country,
    String? userId,
    String? establishmentId,
    SyncState? syncState,
    bool? isDeleted,
  }) {
    return AddressModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      street: street ?? this.street,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      complement: complement ?? this.complement,
      zipCode: zipCode ?? this.zipCode,
      state: state ?? this.state,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      userId: userId ?? this.userId,
      establishmentId: establishmentId ?? this.establishmentId,
      syncState: syncState ?? this.syncState,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': DateTime.now().toIso8601String(),
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'complement': complement,
      'zip_code': zipCode,
      'state': state,
      'lat': lat,
      'long': long,
      'address': address,
      'city': city,
      'country': country,
      'user_id': userId,
      'establishment_id': establishmentId,
      'is_deleted': isDeleted,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      street: map['street'] ?? "",
      number: map['number'] ?? "",
      neighborhood: map['neighborhood'] ?? "",
      complement: map['complement'] ?? "",
      zipCode: map['zipCode'] ?? "",
      state: map['state'] ?? "",
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
      address: map['address'] ?? "",
      city: map['city'] ?? "",
      country: map['country'] ?? "",
      userId: map['user_id'],
      establishmentId: map['establishment_id'],
      isDeleted: map['is_deleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, street: $street, number: $number, neighborhood: $neighborhood, complement: $complement, zipCode: $zipCode, state: $state, lat: $lat, lon: $long, address: $address, city: $city, country: $country, userId: $userId, establishmentId: $establishmentId)';
  }
}
