import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.nit,
    required this.password,
  });

  String nit;
  String password;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        nit: json['nit'] == null ? '' : json['nit'].toString(),
        password: json['password'] == null ? '' : json['password'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'nit': nit,
        'password': password,
      };
}
