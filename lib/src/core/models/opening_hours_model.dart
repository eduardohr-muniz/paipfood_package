import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class OpeningHoursModel {
  DateTime? createdAt;
  DateTime? updatedAt;
  String id;
  String establishmentId;
  WeekDayEnum weekDayId;
  DateTime openningDate;
  DateTime closingDate;
  HoursEnum openingEnumValue;
  HoursEnum closingEnumValue;

  OpeningHoursModel({
    required this.id,
    required this.establishmentId,
    required this.weekDayId,
    required this.openningDate,
    required this.closingDate,
    required this.openingEnumValue,
    required this.closingEnumValue,
    this.createdAt,
    this.updatedAt,
  });

  OpeningHoursModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? establishmentId,
    WeekDayEnum? weekDayId,
    DateTime? openningDate,
    DateTime? closingDate,
    HoursEnum? openingEnumValue,
    HoursEnum? closingEnumValue,
  }) {
    return OpeningHoursModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      establishmentId: establishmentId ?? this.establishmentId,
      weekDayId: weekDayId ?? this.weekDayId,
      openningDate: openningDate ?? this.openningDate,
      closingDate: closingDate ?? this.closingDate,
      openingEnumValue: openingEnumValue ?? this.openingEnumValue,
      closingEnumValue: closingEnumValue ?? this.closingEnumValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt?.toTimesTamptzFormat ?? DateTime.now().toTimesTamptzFormat,
      'updated_at': updatedAt?.toTimesTamptzFormat ?? DateTime.now().toTimesTamptzFormat,
      'id': id,
      'establishment_id': establishmentId,
      'week_day_id': weekDayId.id,
      'openning_date': openningDate.toTimesTamptzFormat,
      'closing_date': closingDate.toTimesTamptzFormat,
      'opening_enum_value': openingEnumValue.value,
      'closing_enum_value': closingEnumValue.value,
    };
  }

  factory OpeningHoursModel.fromMap(Map<String, dynamic> map) {
    return OpeningHoursModel(
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      id: map['id'] ?? '',
      establishmentId: map['establishment_id'] ?? '',
      weekDayId: WeekDayEnum.fromMap(map['week_day_id']),
      openningDate: DateTime.parse(map['openning_date']),
      closingDate: DateTime.parse(map['closing_date']),
      openingEnumValue: HoursEnum.fromMap(map['opening_enum_value'].toDouble()),
      closingEnumValue: HoursEnum.fromMap(map['closing_enum_value'].toDouble()),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpeningHoursModel.fromJson(String source) => OpeningHoursModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OpeningHoursModel &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.id == id &&
        other.establishmentId == establishmentId &&
        other.weekDayId == weekDayId &&
        other.openningDate == openningDate &&
        other.closingDate == closingDate &&
        other.openingEnumValue == openingEnumValue &&
        other.closingEnumValue == closingEnumValue;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        updatedAt.hashCode ^
        id.hashCode ^
        establishmentId.hashCode ^
        weekDayId.hashCode ^
        openningDate.hashCode ^
        closingDate.hashCode ^
        openingEnumValue.hashCode ^
        closingEnumValue.hashCode;
  }
}
