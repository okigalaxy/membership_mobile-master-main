// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.success,
    this.data,
  });

  bool success;
  List<Data> data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
    this.id,
    this.image,
    this.judul,
    this.isi,
  });

  int no;
  int id;
  String image;
  String judul;
  String isi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        no: json["no"],
        id: json["id"],
        image: json["image"],
        judul: json["judul"],
        isi: json["isi"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "id": id,
        "image": image,
        "judul": judul,
        "isi": isi,
      };
}
