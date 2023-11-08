import 'dart:convert';

class UserModel {
  final String? id;
  final String? email;
  final DateTime? emailConfirmedAt;
  final String? phone;
  final DateTime? confirmedAt;
  final DateTime? lastSignInAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? surname;
  UserModel({
    this.id,
    this.email,
    this.emailConfirmedAt,
    this.phone,
    this.confirmedAt,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.surname,
  });

  UserModel copyWith({
    String? id,
    String? email,
    DateTime? emailConfirmedAt,
    String? phone,
    DateTime? confirmedAt,
    DateTime? lastSignInAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? surname,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      emailConfirmedAt: emailConfirmedAt ?? this.emailConfirmedAt,
      phone: phone ?? this.phone,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      lastSignInAt: lastSignInAt ?? this.lastSignInAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'email_confirmed_at': emailConfirmedAt?.millisecondsSinceEpoch,
      'phone': phone,
      'confirmed_at': confirmedAt?.millisecondsSinceEpoch,
      'last_sign_in_at': lastSignInAt?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'name': name,
      'surname': surname,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      emailConfirmedAt: map['email_confirmed_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['email_confirmed_at']) : null,
      phone: map['phone'],
      confirmedAt: map['confirmed_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['confirmed_at']) : null,
      lastSignInAt: map['last_sign_in_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['last_sign_in_at']) : null,
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : null,
      name: map['name'],
      surname: map['surname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
