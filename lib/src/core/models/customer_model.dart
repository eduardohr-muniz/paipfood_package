import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class CustomerModel {
  String? userId;
  String name;
  String phone;
  DateTime? birthdate;
  List<AddressModel> addresses;
  AddressModel? address;
  bool isSingleCustomer;

  CustomerModel({
    required this.addresses,
    this.userId,
    this.name = '',
    this.phone = '',
    this.birthdate,
    this.address,
    this.isSingleCustomer = false,
  });
  static String box = 'client_model';

  CustomerModel copyWith({
    String? userId,
    String? name,
    String? phone,
    DateTime? birthdate,
    List<AddressModel>? addresses,
    AddressModel? address,
    bool? isSingleCustomer,
  }) {
    return CustomerModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      addresses: addresses ?? this.addresses,
      address: address ?? this.address,
      isSingleCustomer: isSingleCustomer ?? this.isSingleCustomer,
    );
  }

  CustomerModel clone() {
    return CustomerModel(
      name: name,
      phone: phone,
      birthdate: birthdate,
      addresses: addresses.map((e) => e.clone()).toList(),
      address: address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'phone': phone,
      'birthdate': birthdate?.millisecondsSinceEpoch,
      'addresses': addresses.map((x) => x.toMap()).toList(),
      'address': address?.toMap(),
      'isSingleCustomer': isSingleCustomer,
    };
  }

  factory CustomerModel.fromMap(Map map) {
    return CustomerModel(
      userId: map['userId'],
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      birthdate: map['birthdate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['birthdate']) : null,
      addresses: List<AddressModel>.from(map['addresses']?.map((x) => AddressModel.fromMap(x)) ?? const []),
      address: map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      isSingleCustomer: map['isSingleCustomer'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source));
}
