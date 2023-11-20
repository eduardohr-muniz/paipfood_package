import 'dart:convert';

class AddressModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? toUpdate;
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
  final String? userId;
  final int? establishmentId;
  AddressModel({
    required this.latitude,
    required this.longitude,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.id,
    this.street = '',
    this.number = '',
    this.neighborhood = '',
    this.complement = '',
    this.zipCode = '',
    this.state = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.userId,
    this.establishmentId,
  });

  AddressModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
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
    String? userId,
    int? establishmentId,
  }) {
    return AddressModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
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
      userId: userId ?? this.userId,
      establishmentId: establishmentId ?? this.establishmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated-at': DateTime.now().toIso8601String(),
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
      'user_id': userId,
      'establishment_id': establishmentId,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['to_update'] ?? false,
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
      userId: map['user_id'],
      establishmentId: map['establishment_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
