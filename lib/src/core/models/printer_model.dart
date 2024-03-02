import 'dart:convert';
import 'dart:io';

import 'package:paipfood_package/paipfood_package.dart';

class PrinterModel {
  String name;
  String operatingSystem = Platform.operatingSystem;
  String? vendorId;
  String? productId;
  String? address;
  PrinterType printerType;
  String? ip;
  String? port;
  bool isActive;
  int qtyCopy;
  PrinterModel({
    required this.printerType,
    this.name = '',
    this.operatingSystem = '',
    this.vendorId,
    this.productId,
    this.address,
    this.ip,
    this.port,
    this.isActive = false,
    this.qtyCopy = 1,
  });

  static String box = 'printer_model';

  PrinterModel copyWith({
    String? name,
    String? operatingSystem,
    String? vendorId,
    String? productId,
    String? address,
    PrinterType? printerType,
    String? ip,
    String? port,
    bool? isActive,
    int? qtyCopy,
  }) {
    return PrinterModel(
      name: name ?? this.name,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      vendorId: vendorId ?? this.vendorId,
      productId: productId ?? this.productId,
      address: address ?? this.address,
      printerType: printerType ?? this.printerType,
      ip: ip ?? this.ip,
      port: port ?? this.port,
      isActive: isActive ?? this.isActive,
      qtyCopy: qtyCopy ?? this.qtyCopy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'operating_system': operatingSystem,
      'vendor_id': vendorId,
      'product_id': productId,
      'address': address,
      'printer_type': printerType.name,
      'ip': ip,
      'port': port,
      'is_active': isActive,
      'qty_copy': qtyCopy,
    };
  }

  factory PrinterModel.fromMap(Map map) {
    return PrinterModel(
      name: map['name'] ?? '',
      operatingSystem: map['operating_system'] ?? '',
      vendorId: map['vendor_id'],
      productId: map['product_id'],
      address: map['address'],
      printerType: PrinterType.values.firstWhere((element) => element.name == map["printer_type"], orElse: () => PrinterType.usb),
      ip: map['ip'],
      port: map['port'],
      isActive: map['is_active'] ?? false,
      qtyCopy: map['qty_copy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PrinterModel.fromJson(String source) => PrinterModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrinterModel &&
        other.name == name &&
        other.operatingSystem == operatingSystem &&
        other.vendorId == vendorId &&
        other.productId == productId &&
        other.address == address &&
        other.printerType == printerType &&
        other.ip == ip &&
        other.port == port &&
        other.isActive == isActive &&
        other.qtyCopy == qtyCopy;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        operatingSystem.hashCode ^
        vendorId.hashCode ^
        productId.hashCode ^
        address.hashCode ^
        printerType.hashCode ^
        ip.hashCode ^
        port.hashCode ^
        isActive.hashCode ^
        qtyCopy.hashCode;
  }
}
