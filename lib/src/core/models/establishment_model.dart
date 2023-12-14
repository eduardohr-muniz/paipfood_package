import 'dart:convert';

import 'package:paipfood_package/src/core/enums/zz_enums_export.dart';

import 'zz_models_export.dart';

// preferenceTheme: PreferenceTheme.values.firstWhere((eleiment) => element.name == map['preference_theme']),
const List<CheckPointEnum> checkPointsDef = [CheckPointEnum.establishment, CheckPointEnum.delivery];

class EstablishmentModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool toUpdate;
  final String companySlug;
  final String fantasyName;
  final String corporateName;
  final String description;
  final String personalDocument;
  final String businessDocument;
  final bool isOpen;
  final bool isBlocked;
  final double pendingRate;
  final bool isHigherPricePizza;
  final String? logo;
  final String? banner;
  final AddressModel? address;
  final CulinaryStyleEnum culinaryStyle;
  final double minimunOrder;
  final int dueDate;
  final List<CheckPointEnum> checkPoints;
  final ThemeEnum theme;
  final String phone;
  final String phoneCountryCode;
  EstablishmentModel({
    this.id,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.toUpdate = false,
    this.companySlug = '',
    this.fantasyName = '',
    this.corporateName = '',
    this.description = '',
    this.personalDocument = '',
    this.businessDocument = '',
    this.isOpen = false,
    this.isBlocked = false,
    this.pendingRate = 0.0,
    this.isHigherPricePizza = false,
    this.logo,
    this.banner,
    this.culinaryStyle = CulinaryStyleEnum.fastFood,
    this.minimunOrder = 10,
    this.dueDate = 10,
    this.checkPoints = checkPointsDef,
    this.theme = ThemeEnum.paip,
    this.phone = '',
    this.phoneCountryCode = '',
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
    String? logo,
    String? banner,
    AddressModel? address,
    CulinaryStyleEnum? culinaryStyle,
    double? minimunOrder,
    int? dueDate,
    List<CheckPointEnum>? checkPoints,
    ThemeEnum? theme,
    String? phone,
    String? phoneCountryCode,
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
      logo: logo ?? this.logo,
      banner: banner ?? this.banner,
      address: address ?? this.address,
      culinaryStyle: culinaryStyle ?? this.culinaryStyle,
      minimunOrder: minimunOrder ?? this.minimunOrder,
      dueDate: dueDate ?? this.dueDate,
      checkPoints: checkPoints ?? this.checkPoints,
      theme: theme ?? this.theme,
      phone: phone ?? this.phone,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated_at': DateTime.now().toIso8601String(),
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
      'logo': logo,
      'banner': banner,
      'culinary_style': culinaryStyle.name,
      'minimun_order': minimunOrder,
      'due_date': dueDate,
      'check_points': checkPoints.map((e) => e.name).toList(),
      'theme': theme.name,
      'phone': phone,
      'phone_country_code': phoneCountryCode,
    };
  }

  factory EstablishmentModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      id: map['id'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      toUpdate: map['to_update'] ?? false,
      companySlug: map['company_slug'] ?? '',
      fantasyName: map['fantasy_name'] ?? '',
      corporateName: map['corporate_name'] ?? '',
      description: map['description'] ?? '',
      personalDocument: map['personal_document'] ?? '',
      businessDocument: map['business_document'] ?? '',
      isOpen: map['is_open'] ?? false,
      isBlocked: map['is_blocked'] ?? false,
      pendingRate: map['pending_rate']?.toDouble() ?? 0,
      isHigherPricePizza: map['is_higher_price_pizza'] ?? false,
      logo: map['logo'],
      banner: map['banner'],
      culinaryStyle: map['culinary_style'] != null ? CulinaryStyleEnum.fromMap(map['culinary_style']) : CulinaryStyleEnum.fastFood,
      minimunOrder: map['minimun_order']?.toDouble() ?? 10.00,
      dueDate: map['due_date']?.toInt() ?? 0,
      checkPoints: List<CheckPointEnum>.from(map['check_points']?.map((checkPoint) {
            return CheckPointEnum.values.firstWhere((element) => element.name == checkPoint);
          }).toList() ??
          []),
      theme: ThemeEnum.values.firstWhere((element) => element.name == map['theme'], orElse: () => ThemeEnum.paip),
      phone: map['phone'] ?? '',
      phoneCountryCode: map['phone_country_code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentModel.fromJson(String source) => EstablishmentModel.fromMap(json.decode(source));
}
