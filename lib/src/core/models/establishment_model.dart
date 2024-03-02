import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/enums/zz_enums_export.dart';

import 'zz_models_export.dart';

const List<OrderTypeEnum> orderTypesDef = [OrderTypeEnum.pickUp, OrderTypeEnum.delivery];

class EstablishmentModel {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String companySlug;
  int totalOrders;
  int currentOrderNumber;
  int currentLocalOrderNumber;
  String fantasyName;
  String corporateName;
  String description;
  String personalDocument;
  String businessDocument;
  bool isOpen;
  bool isBlocked;
  double pendingRate;
  bool isHigherPricePizza;
  String? logo;
  String? banner;
  AddressModel? address;
  CulinaryStyleEnum culinaryStyle;
  double minimunOrder;
  int dueDate;
  String phone;
  String phoneCountryCode;
  String email;
  List<OrderTypeEnum> orderTypes;
  List<DeliveryAreasModel> deliveryAreas;
  List<PaymentFlagEnum> paymentFlagsLocal;
  List<PaymentFlagEnum> paymentFlagsApp;
  SyncState syncState;
  Map<String, dynamic> paymentProvider;
  EstablishmentModel({
    required this.id,
    required this.deliveryAreas,
    required this.companySlug,
    required this.paymentFlagsApp,
    required this.paymentProvider,
    this.totalOrders = 0,
    this.currentOrderNumber = 0,
    this.currentLocalOrderNumber = 0,
    this.createdAt,
    this.updatedAt,
    this.address,
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
    this.orderTypes = orderTypesDef,
    this.phone = '',
    this.phoneCountryCode = '',
    this.email = '',
    this.syncState = SyncState.none,
    this.paymentFlagsLocal = const [PaymentFlagEnum.money, PaymentFlagEnum.visa, PaymentFlagEnum.master],
  });
  static const String box = "establishments";
  EstablishmentModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? companySlug,
    int? totalOrders,
    int? currentOrderNumber,
    int? currentLocalOrderNumber,
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
    String? phone,
    String? phoneCountryCode,
    String? email,
    List<OrderTypeEnum>? orderTypes,
    List<DeliveryAreasModel>? deliveryAreas,
    List<PaymentFlagEnum>? paymentFlagsLocal,
    List<PaymentFlagEnum>? paymentFlagsApp,
    SyncState? syncState,
    Map<String, dynamic>? paymentProvider,
  }) {
    return EstablishmentModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      companySlug: companySlug ?? this.companySlug,
      totalOrders: totalOrders ?? this.totalOrders,
      currentOrderNumber: currentOrderNumber ?? this.currentOrderNumber,
      currentLocalOrderNumber: currentLocalOrderNumber ?? this.currentLocalOrderNumber,
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
      phone: phone ?? this.phone,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      email: email ?? this.email,
      orderTypes: orderTypes ?? this.orderTypes,
      deliveryAreas: deliveryAreas ?? this.deliveryAreas,
      paymentFlagsLocal: paymentFlagsLocal ?? this.paymentFlagsLocal,
      paymentFlagsApp: paymentFlagsApp ?? this.paymentFlagsApp,
      syncState: syncState ?? this.syncState,
      paymentProvider: paymentProvider ?? this.paymentProvider,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': DateTime.now().toTimesTamptzFormat,
      'current_order_number': currentOrderNumber,
      'current_local_order_number': currentLocalOrderNumber,
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
      'order_types': orderTypes.map((e) => e.name).toList(),
      'phone': phone,
      'phone_country_code': phoneCountryCode,
      'email': email,
      'payment_flags_local': paymentFlagsLocal.map((e) => e.name).toList(),
      'payment_flags_app': paymentFlagsApp.map((e) => e.name).toList(),
      'payment_provider': paymentProvider,
    };
  }

  factory EstablishmentModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      totalOrders: map['total_orders']?.toInt() ?? 0,
      currentOrderNumber: map['current_order_number']?.toInt() ?? 0,
      currentLocalOrderNumber: map['current_local_order_number']?.toInt() ?? 0,
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
      paymentFlagsLocal: List<PaymentFlagEnum>.from(map['payment_flags_local']?.map((paymentMethod) {
            return PaymentFlagEnum.fromMap(paymentMethod);
          }).toList() ??
          []),
      paymentFlagsApp: List<PaymentFlagEnum>.from(map['payment_flags_app']?.map((paymentMethod) {
            return PaymentFlagEnum.fromMap(paymentMethod);
          }).toList() ??
          []),
      orderTypes: List<OrderTypeEnum>.from(map['order_types']?.map((checkPoint) {
            return OrderTypeEnum.values.firstWhere((element) => element.name == checkPoint);
          }).toList() ??
          []),
      phone: map['phone'] ?? '',
      phoneCountryCode: map['phone_country_code'] ?? '',
      email: map['email'] ?? '',
      deliveryAreas: [],
      paymentProvider: map['payment_provider'] ?? {},
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentModel.fromJson(String source) => EstablishmentModel.fromMap(json.decode(source));
}
