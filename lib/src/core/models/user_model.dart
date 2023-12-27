import 'dart:convert';

enum Permissions {
  admin,
  cashier;
}

class UserModel {
  final String? id;
  final String? email;
  final DateTime? emailConfirmedAt;
  final String? phone;
  final DateTime? phoneConfirmedAt;
  final DateTime? confirmedAt;
  final DateTime? lastSignInAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String name;
  final List<Permissions>? permissions;
  final String? companySlug;
  UserModel({
    this.id,
    this.email,
    this.emailConfirmedAt,
    this.phone,
    this.phoneConfirmedAt,
    this.confirmedAt,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
    this.name = "",
    this.permissions,
    this.companySlug,
  });

  UserModel copyWith({
    String? id,
    String? email,
    DateTime? emailConfirmedAt,
    String? phone,
    DateTime? phoneConfirmedAt,
    DateTime? confirmedAt,
    DateTime? lastSignInAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    List<Permissions>? permissions,
    String? companySlug,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      emailConfirmedAt: emailConfirmedAt ?? this.emailConfirmedAt,
      phone: phone ?? this.phone,
      phoneConfirmedAt: phoneConfirmedAt ?? this.phoneConfirmedAt,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      lastSignInAt: lastSignInAt ?? this.lastSignInAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      permissions: permissions ?? this.permissions,
      companySlug: companySlug ?? this.companySlug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'updated_at': updatedAt?.toIso8601String(),
      'email': email,
      'email_confirmed_at': emailConfirmedAt?.toIso8601String(),
      'phone': phone,
      'confirmed_at': confirmedAt?.toIso8601String(),
      'phone_confirmed_at': confirmedAt?.toIso8601String(),
      'last_sign_in_at': lastSignInAt?.toIso8601String(),
    };
  }

  Map<String, dynamic> toMapUsers_() {
    return {
      'id': id,
      'updated_at': updatedAt?.toIso8601String(),
      'email': email,
      'phone': phone,
      'name': name,
      'permissions': permissions?.map((e) => e.name).toList(),
      'company_slug': companySlug,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      emailConfirmedAt: map['email_confirmed_at'] != null ? DateTime.parse(map['email_confirmed_at']) : null,
      phone: map['phone'],
      phoneConfirmedAt: map['phone_confirmed_at'] != null ? DateTime.parse(map['phone_confirmed_at']) : null,
      confirmedAt: map['confirmed_at'] != null ? DateTime.parse(map['confirmed_at']) : null,
      lastSignInAt: map['last_sign_in_at'] != null ? DateTime.parse(map['last_sign_in_at']) : null,
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      name: map['name'] ?? "",
      permissions: map['permissions'] != null
          ? (map['permissions'] as List).map((permission) => Permissions.values.firstWhere((element) => element.name == permission)).toList()
          : null,
      companySlug: map['company_slug'],
    );
  }

  String toJson() => json.encode(toMap());
  String toJsonUsers_() => json.encode(toMapUsers_());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
