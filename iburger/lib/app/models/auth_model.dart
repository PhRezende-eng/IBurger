import 'dart:convert';

class AuthModel {
  final String accessToken;
  final String refreshToken;
  AuthModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) => AuthModel(
        accessToken: map['access_token'] ?? '',
        refreshToken: map['refresh_token'] ?? '',
      );

  Map<String, dynamic> get toMap => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(
        json.decode(source),
      );

  String get toJson => json.encode(toMap);
}
