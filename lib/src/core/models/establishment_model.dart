import 'dart:convert';
import 'package:flutter/material.dart';
import 'paip_models.dart';

enum PreferenceTheme {
  mars(Colors.red),
  star(Color(0xffffab00)),
  eclipse(Color(0xffef6c00)),
  cosmos(Color(0xff1a237e)),
  andromeda(Color(0xff00acc1)),
  celest(Color(0xff00695c)),
  paip(Color(0xff49A568)),
  galactica(Color(0xff7b1fa2)),
  sweet(Color(0xffff4081)),
  meteor(Color(0xff4e342e)),
  blackHole(Colors.black);

  final Color color;

  const PreferenceTheme(this.color);
}

enum PaymentsType {
  pix;
}

// preferenceTheme: PreferenceTheme.values.firstWhere((element) => element.name == map['preference_theme']),
class EstablishmentModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String companySlug;
  final String fantasyName;
  final String? corporateName;
  final String? description;
  final String personalDocument;
  final String? businessDocument;
  final bool isOpen;
  final bool isBlocked;
  final double? pendingRate;
  final bool isHigherPricePizza;
  final int? companyId;
  final List<PaymentTypeModel> paymentTypesEstablishment;
  final List<PaymentTypeModel> paymentTypesDelivered;
  final String? logo;
  final String? banner;
  final int? addressId;
  final AddressModel? address;
  final CulinaryStyleModel? culinaryStyle;
  final double? minimunOrder;
  final int dueDate;
  EstablishmentModel({
    this.id,
    this.companyId,
    this.addressId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.companySlug = '',
    this.fantasyName = '',
    this.corporateName,
    this.description,
    this.personalDocument = '',
    this.businessDocument,
    this.isOpen = false,
    this.isBlocked = false,
    this.pendingRate,
    this.isHigherPricePizza = false,
    this.paymentTypesEstablishment = const [],
    this.paymentTypesDelivered = const [],
    this.logo,
    this.banner,
    this.culinaryStyle,
    this.minimunOrder,
    this.dueDate = 10,
  });

  EstablishmentModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? companySlug,
    String? fantasyName,
    String? corporateName,
    String? description,
    String? personalDocument,
    String? businessDocument,
    bool? isOpen,
    bool? isBlocked,
    double? pendingRate,
    bool? isHigherPricePizza,
    CompanyModel? company,
    List<PaymentTypeModel>? paymentTypesEstablishment,
    List<PaymentTypeModel>? paymentTypesDelivered,
    String? logo,
    String? banner,
    AddressModel? address,
    int? addressId,
    CulinaryStyleModel? culinaryStyle,
    double? minimunOrder,
    int? dueDate,
  }) {
    return EstablishmentModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      companySlug: companySlug ?? this.companySlug,
      fantasyName: fantasyName ?? this.fantasyName,
      corporateName: corporateName ?? this.corporateName,
      description: description ?? this.description,
      personalDocument: personalDocument ?? this.personalDocument,
      businessDocument: businessDocument ?? this.businessDocument,
      isOpen: isOpen ?? this.isOpen,
      isBlocked: isBlocked ?? this.isBlocked,
      pendingRate: pendingRate ?? this.pendingRate,
      isHigherPricePizza: isHigherPricePizza ?? this.isHigherPricePizza,
      companyId: companyId ?? companyId,
      paymentTypesEstablishment: paymentTypesEstablishment ?? this.paymentTypesEstablishment,
      paymentTypesDelivered: paymentTypesDelivered ?? this.paymentTypesDelivered,
      logo: logo ?? this.logo,
      banner: banner ?? this.banner,
      addressId: addressId ?? this.addressId,
      address: address ?? this.address,
      culinaryStyle: culinaryStyle ?? this.culinaryStyle,
      minimunOrder: minimunOrder ?? this.minimunOrder,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated_at': updatedAt?.toIso8601String(),
      'company_slug': companySlug,
      'fantasy_name': fantasyName,
      'corporate_name': corporateName,
      'description': description,
      'personal_document': personalDocument,
      'business_document': businessDocument,
      'is_open': isOpen,
      'is_blocked': isBlocked,
      'pending_rate': pendingRate,
      'is_higher_price_pizza': isHigherPricePizza,
      'company_id': companyId,
      'payment_types_establishment': paymentTypesEstablishment.map((x) => x.toMap()).toList(),
      'payment_types_delivered': paymentTypesDelivered.map((x) => x.toMap()).toList(),
      'logo': logo,
      'banner': banner,
      'culinary_style': culinaryStyle?.toMap(),
      'minimun_order': minimunOrder,
      'address_id': addressId,
      'due_date': dueDate,
    };
  }

  factory EstablishmentModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_At']) : null,
      toUpdate: map['to_update'] ?? false,
      companySlug: map['company_slug'] ?? '',
      fantasyName: map['fantasy_name'] ?? '',
      corporateName: map['corporate_name'],
      description: map['description'],
      personalDocument: map['personal_document'] ?? '',
      businessDocument: map['business_document'],
      isOpen: map['is_open'] ?? false,
      isBlocked: map['is_blocked'] ?? false,
      pendingRate: map['pending_rate']?.toDouble(),
      isHigherPricePizza: map['is_higher_price_pizza'] ?? false,
      companyId: map['company_id'],
      paymentTypesEstablishment: List<PaymentTypeModel>.from(map['payment_types_establishment']?.map(PaymentTypeModel.fromMap) ?? const []),
      paymentTypesDelivered: List<PaymentTypeModel>.from(map['payment_types_delivered']?.map(PaymentTypeModel.fromMap) ?? const []),
      logo: map['logo'],
      banner: map['banner'],
      addressId: map['address_id'],
      culinaryStyle: map['culinary_style'] != null ? CulinaryStyleModel.fromMap(map['culinary_style']) : null,
      minimunOrder: map['minimun_order']?.toDouble(),
      dueDate: map['due_date']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentModel.fromJson(String source) => EstablishmentModel.fromMap(json.decode(source));
}
