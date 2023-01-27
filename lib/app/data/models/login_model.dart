// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.token,
    this.user,
  });

  bool success;
  String token;
  Data user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        token: json["token"],
        user: Data.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "user": user.toJson(),
      };
}

class Data {
  Data({
    this.nama,
  });

  String nama;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
