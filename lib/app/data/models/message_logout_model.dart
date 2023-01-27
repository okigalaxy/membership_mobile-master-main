// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageLogoutModel messageLogoutModelFromJson(String str) =>
    MessageLogoutModel.fromJson(json.decode(str));

String messageLogoutModelToJson(MessageLogoutModel data) =>
    json.encode(data.toJson());

class MessageLogoutModel {
  MessageLogoutModel({
    this.success,
    this.message,
  });

  bool success;
  String message;

  factory MessageLogoutModel.fromJson(Map<String, dynamic> json) =>
      MessageLogoutModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
