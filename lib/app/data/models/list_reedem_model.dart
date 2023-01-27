// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

ListReedemModel listReedemModelFromJson(String str) =>
    ListReedemModel.fromJson(json.decode(str));

String listReedemModelToJson(ListReedemModel data) =>
    json.encode(data.toJson());

class ListReedemModel {
  ListReedemModel({
    this.success,
    this.data,
  });

  bool success;
  List<Data> data;

  factory ListReedemModel.fromJson(Map<String, dynamic> json) =>
      ListReedemModel(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<String>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.no,
    this.image,
    this.item,
    this.reedem_point,
  });

  int no;
  String image;
  String item;
  int reedem_point;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        no: json["no"],
        image: json["image"],
        item: json["item"],
        reedem_point: json["reedem_point"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "image": image,
        "item": item,
        "reedem_point": reedem_point,
      };
}
