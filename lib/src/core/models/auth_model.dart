import 'dart:convert';

import 'package:paipfood_package/paipfood_package.dart';

class AuthModel {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final int? expiresAt;
  final String? refreshToken;
  final UserModel? user;
  AuthModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.expiresAt,
    this.refreshToken,
    this.user,
  });
  static const String box = "auth";
  AuthModel copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    int? expiresAt,
    String? refreshToken,
    UserModel? user,
  }) {
    return AuthModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      expiresAt: expiresAt ?? this.expiresAt,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'expires_at': expiresAt,
      'refresh_token': refreshToken,
      'user': user?.toMapUsers_(),
    };
  }

  factory AuthModel.fromMap(Map map) {
    return AuthModel(
      accessToken: map['access_token'],
      tokenType: map['token_type'],
      expiresIn: map['expires_in']?.toInt(),
      expiresAt: map['expires_at']?.toInt(),
      refreshToken: map['refresh_token'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthModel(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, expiresAt: $expiresAt, refreshToken: $refreshToken, user: $user)';
  }
}
