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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String slug;
  final String fantasyName;
  final String? corporateName;
  final String? description;
  final String personalDocument;
  final String? businessDocument;
  final bool isOpen;
  final bool isBlocked;
  final double? pendingRate;
  final bool isHiguerPricePizza;
  final CompanyModel company;
  final List<PaymentTypeModel> paymentTypesEstablishment;
  final List<PaymentTypeModel> paymentTypesDelivered;
  final String? logo;
  final String? banner;
  final AddressModel address;
  final CulinaryStyleModel? culinaryStyle;
  final double? minimunOrder;
  final int dueDate;
  EstablishmentModel({
    required this.company,
    required this.address,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.slug = '',
    this.fantasyName = '',
    this.corporateName,
    this.description,
    this.personalDocument = '',
    this.businessDocument,
    this.isOpen = false,
    this.isBlocked = false,
    this.pendingRate,
    this.isHiguerPricePizza = false,
    this.paymentTypesEstablishment = const [],
    this.paymentTypesDelivered = const [],
    this.logo,
    this.banner,
    this.culinaryStyle,
    this.minimunOrder,
    this.dueDate = 10,
  });

  EstablishmentModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? toUpdate,
    String? slug,
    String? fantasyName,
    String? corporateName,
    String? description,
    String? personalDocument,
    String? businessDocument,
    bool? isOpen,
    bool? isBlocked,
    double? pendingRate,
    bool? isHiguerPricePizza,
    CompanyModel? company,
    List<PaymentTypeModel>? paymentTypesEstablishment,
    List<PaymentTypeModel>? paymentTypesDelivered,
    String? logo,
    String? banner,
    AddressModel? address,
    CulinaryStyleModel? culinaryStyle,
    double? minimunOrder,
    int? dueDate,
  }) {
    return EstablishmentModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      toUpdate: toUpdate ?? this.toUpdate,
      slug: slug ?? this.slug,
      fantasyName: fantasyName ?? this.fantasyName,
      corporateName: corporateName ?? this.corporateName,
      description: description ?? this.description,
      personalDocument: personalDocument ?? this.personalDocument,
      businessDocument: businessDocument ?? this.businessDocument,
      isOpen: isOpen ?? this.isOpen,
      isBlocked: isBlocked ?? this.isBlocked,
      pendingRate: pendingRate ?? this.pendingRate,
      isHiguerPricePizza: isHiguerPricePizza ?? this.isHiguerPricePizza,
      company: company ?? this.company,
      paymentTypesEstablishment: paymentTypesEstablishment ?? this.paymentTypesEstablishment,
      paymentTypesDelivered: paymentTypesDelivered ?? this.paymentTypesDelivered,
      logo: logo ?? this.logo,
      banner: banner ?? this.banner,
      address: address ?? this.address,
      culinaryStyle: culinaryStyle ?? this.culinaryStyle,
      minimunOrder: minimunOrder ?? this.minimunOrder,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_At': updatedAt?.millisecondsSinceEpoch,
      'to_update': toUpdate,
      'slug': slug,
      'fantasy_name': fantasyName,
      'corporate_name': corporateName,
      'description': description,
      'personal_document': personalDocument,
      'business_document': businessDocument,
      'is_open': isOpen,
      'is_blocked': isBlocked,
      'pending_rate': pendingRate,
      'is_higuer_price_pizza': isHiguerPricePizza,
      'company': company.toMap(),
      'payment_types_establishment': paymentTypesEstablishment.map((x) => x.toMap()).toList(),
      'payment_types_delivered': paymentTypesDelivered.map((x) => x.toMap()).toList(),
      'logo': logo,
      'banner': banner,
      'address': address.toMap(),
      'culinary_style': culinaryStyle?.toMap(),
      'minimun_order': minimunOrder,
      'due_date': dueDate,
    };
  }

  factory EstablishmentModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_At'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_At']) : null,
      toUpdate: map['to_update'] ?? false,
      slug: map['slug'] ?? '',
      fantasyName: map['fantasy_name'] ?? '',
      corporateName: map['corporate_name'],
      description: map['description'],
      personalDocument: map['personal_document'] ?? '',
      businessDocument: map['business_document'],
      isOpen: map['is_open'] ?? false,
      isBlocked: map['is_blocked'] ?? false,
      pendingRate: map['pending_rate']?.toDouble(),
      isHiguerPricePizza: map['is_higuer_price_pizza'] ?? false,
      company: CompanyModel.fromMap(map['company']),
      paymentTypesEstablishment: List<PaymentTypeModel>.from(map['payment_types_establishment']?.map(PaymentTypeModel.fromMap) ?? const []),
      paymentTypesDelivered: List<PaymentTypeModel>.from(map['payment_types_delivered']?.map(PaymentTypeModel.fromMap) ?? const []),
      logo: map['logo'],
      banner: map['banner'],
      address: AddressModel.fromMap(map['address']),
      culinaryStyle: map['culinary_style'] != null ? CulinaryStyleModel.fromMap(map['culinary_style']) : null,
      minimunOrder: map['minimun_order']?.toDouble(),
      dueDate: map['due_date']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentModel.fromJson(String source) => EstablishmentModel.fromMap(json.decode(source));
}
