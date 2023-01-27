// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  HistoryModel({
    this.success,
    this.data,
  });

  bool success;
  List<Data> data;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
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
    this.invoice,
    this.total_transaksi,
    this.total_berat,
    this.total_belanja,
    this.poin_reward,
    this.tanggal,
    this.date,
  });

  String invoice;
  int total_transaksi;
  String total_berat;
  String total_belanja;
  int poin_reward;
  String tanggal;
  String date;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        invoice: json["invoice"],
        total_transaksi: json["total_transaksi"],
        total_berat: json["total_berat"],
        total_belanja: json["total_belanja"],
        poin_reward: json["poin_reward"],
        tanggal: json["tanggal"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "invoice": invoice,
        "total_transaksi": total_transaksi,
        "total_berat": total_berat,
        "total_belanja": total_belanja,
        "poin_reward": poin_reward,
        "tanggal": tanggal,
        "date": date,
      };
}
