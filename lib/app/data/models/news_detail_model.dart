// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

NewsDetailModel newsDetailModelFromJson(String str) =>
    NewsDetailModel.fromJson(json.decode(str));

String newsDetailModelToJson(NewsDetailModel data) =>
    json.encode(data.toJson());

class NewsDetailModel {
  NewsDetailModel({
    this.success,
    this.data,
  });

  bool success;
  List<Data> data;

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) =>
      NewsDetailModel(
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
    this.image,
    this.judul,
    this.isi,
  });

  String image;
  String judul;
  String isi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"],
        judul: json["judul"],
        isi: json["isi"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "judul": judul,
        "isi": isi,
      };
}
