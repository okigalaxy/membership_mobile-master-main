// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryReedemModel historyReedemModelFromJson(String str) =>
    HistoryReedemModel.fromJson(json.decode(str));

String historyReedemModelToJson(HistoryReedemModel data) =>
    json.encode(data.toJson());

class HistoryReedemModel {
  HistoryReedemModel({
    this.success,
    this.data,
  });

  bool success;
  List<Data> data;

  factory HistoryReedemModel.fromJson(Map<String, dynamic> json) =>
      HistoryReedemModel(
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
    this.nama,
    this.item,
    this.poin,
    this.sisa_poin,
    this.image,
    this.tanggal,
  });

  int no;
  String nama;
  String item;
  int poin;
  int sisa_poin;
  String image;
  String tanggal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        no: json["no"],
        nama: json["nama"],
        item: json["item"],
        poin: json["poin"],
        sisa_poin: json["sisa_poin"],
        image: json["image"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "nama": nama,
        "item": item,
        "poin": poin,
        "sisa_poin": sisa_poin,
        "image": image,
        "tanggal": tanggal,
      };
}
